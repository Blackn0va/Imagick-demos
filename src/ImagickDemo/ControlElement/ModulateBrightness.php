<?php


namespace ImagickDemo\ControlElement;


class ModulateBrightness extends ValueElement {

    protected function getDefault() {
        return 100;
    }

    protected function getMin() {
        return 0;
    }

    protected function getMax() {
        return 200;
    }

    protected function getVariableName() {
        return 'brightness';
    }

    protected function getDisplayName() {
        return 'Brightness';
    }

    function getBrightness() {
        return $this->getValue();
    }
}