<?php


namespace ImagickDemo\ControlElement;


class KernelThirdTerm extends ValueElement {

    protected function getDefault() {
        return false;
    }

    protected function getMin() {
        return 0;
    }

    protected function getMax() {
        return 5;
    }

    protected function getVariableName() {
        return 'kernelThirdTerm';
    }

    protected function getDisplayName() {
        return 'Third term';
    }

    function getKernelThirdTerm() {
        return $this->getValue();
    }
}