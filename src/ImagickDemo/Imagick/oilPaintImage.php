<?php

namespace ImagickDemo\Imagick;


class oilPaintImage extends \ImagickDemo\Example {

    use OriginalImageFile;
    
    function render() {
        return $this->renderImageURL();
    }
}