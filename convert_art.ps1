Add-Type -AssemblyName System.Drawing

function Convert-ToDds($srcPath, $dstPath, $targetWidth, $targetHeight) {
    $img = [System.Drawing.Bitmap]::FromFile($srcPath)
    $resized = New-Object System.Drawing.Bitmap($targetWidth, $targetHeight, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($resized)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, 0, 0, $targetWidth, $targetHeight)
    $g.Dispose()
    $img.Dispose()

    # Lock bits to extract raw ARGB
    $rect = New-Object System.Drawing.Rectangle(0, 0, $targetWidth, $targetHeight)
    $bmpData = $resized.LockBits($rect, [System.Drawing.Imaging.ImageLockMode]::ReadOnly, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $byteCount = [Math]::Abs($bmpData.Stride) * $targetHeight
    $pixels = New-Object byte[] $byteCount
    [System.Runtime.InteropServices.Marshal]::Copy($bmpData.Scan0, $pixels, 0, $byteCount)
    $resized.UnlockBits($bmpData)
    $resized.Dispose()

    # Write DDS header (128 bytes total: 4 magic + 124 header)
    $fs = [System.IO.File]::Create($dstPath)
    $bw = New-Object System.IO.BinaryWriter($fs)

    $bw.Write([System.Text.Encoding]::ASCII.GetBytes("DDS ")) # Magic
    $bw.Write([uint32]124) # dwSize
    $bw.Write([uint32](0x1 + 0x2 + 0x4 + 0x8 + 0x1000)) # dwFlags: CAPS|HEIGHT|WIDTH|PITCH|PIXELFORMAT
    $bw.Write([uint32]$targetHeight) # dwHeight
    $bw.Write([uint32]$targetWidth) # dwWidth
    $bw.Write([uint32]($targetWidth * 4)) # dwPitchOrLinearSize
    $bw.Write([uint32]0) # dwDepth
    $bw.Write([uint32]0) # dwMipMapCount
    for ($i = 0; $i -lt 11; $i++) { $bw.Write([uint32]0) } # dwReserved1[11]

    # DDS_PIXELFORMAT (32 bytes)
    $bw.Write([uint32]32) # dwSize
    $bw.Write([uint32]0x41) # dwFlags: DDPF_RGB | DDPF_ALPHAPIXELS
    $bw.Write([uint32]0) # dwFourCC
    $bw.Write([uint32]32) # dwRGBBitCount
    $bw.Write([uint32]0x00FF0000) # dwRBitMask
    $bw.Write([uint32]0x0000FF00) # dwGBitMask
    $bw.Write([uint32]0x000000FF) # dwBBitMask
    $bw.Write([uint32]0xFF000000L) # dwABitMask

    # Caps (16 bytes)
    $bw.Write([uint32]0x1000) # dwCaps: DDSCAPS_TEXTURE
    $bw.Write([uint32]0) # dwCaps2
    $bw.Write([uint32]0) # dwCaps3
    $bw.Write([uint32]0) # dwCaps4
    $bw.Write([uint32]0) # dwReserved2

    # Pixels (already in BGRA / 32bppArgb order, which matches DDS uncompressed 32bpp ARGB!)
    $bw.Write($pixels, 0, $pixels.Length)

    $bw.Close()
    $fs.Close()
    Write-Output "Generated $dstPath ($($targetWidth)x$($targetHeight))"
}

$base = $PSScriptRoot
$src = Join-Path $base "mayuri.jpg"
if (Test-Path $src) {
    Convert-ToDds $src (Join-Path $base "mayuri_256.dds") 256 256
    Convert-ToDds $src (Join-Path $base "mayuri_80.dds") 80 80
    Convert-ToDds $src (Join-Path $base "mayuri_50.dds") 50 50
    Convert-ToDds $src (Join-Path $base "mayuri_38.dds") 38 38
    Convert-ToDds $src (Join-Path $base "mayuri_32.dds") 32 32
    # Loading / Portrait image
    Convert-ToDds $src (Join-Path $base "mayuri_portrait.dds") 512 512
} else {
    Write-Output "Source file mayuri.jpg not found!"
}
