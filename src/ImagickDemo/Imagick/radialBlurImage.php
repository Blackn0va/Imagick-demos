<?php

namespace ImagickDemo\Imagick;


class radialBlurImage extends \ImagickDemo\Example {

    function renderImageURL() {
        return "<img src='/image/Imagick/radialBlurImage'/>";
    }

    function renderDescription() {

    }

    function renderImage() {

        $imagick = new \Imagick(realpath("../images/TestImage.jpg"));

        $imagick->radialBlurImage(10);

        header("Content-Type: image/jpg");
        echo $imagick->getImageBlob();
    }
}