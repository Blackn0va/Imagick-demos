<?php

namespace ImagickDemo\Imagick;

class IndexExample extends \ImagickDemo\Example {

    function renderTitle() {
        return "Imagick";
    }

    function getColumnRightOffset() {
        return 2;
    }
    
    function render() {
        $output = <<< END
            <p>The Imagick class is probably the most important one in the Imagick extension. It's represents images held by the underlying ImageMagick library, and allows you to call methods on those images</p>

<p>
        Please choose an example from the list.
</p>
END;
  
        return $output;
    }

    function renderImage() {
    }
}