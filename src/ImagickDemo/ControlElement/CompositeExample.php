<?php


namespace ImagickDemo\ControlElement;


class CompositeExample extends OptionKeyElement {

    function getVariableName() {
        return 'compositeExample';
    }

    function getDefault() {
        return 'screenGradients';
    }

    function getDisplayName() {
        return "Composite example";
    }

    function getOptions() {
        return \ImagickDemo\Tutorial\composite::getExamples();
    }

    function getCompositeExampleType() {
        return $this->getKey();
    }
}

 