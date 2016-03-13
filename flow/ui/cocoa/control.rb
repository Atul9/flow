module UI
  class Control < View
    CONTROL_EVENTS = {
      touch:              UIControlEventTouchUpInside,
      editing_changed:    UIControlEventEditingChanged,
      editing_did_begin:  UIControlEventEditingDidBegin,
      editing_did_end:    UIControlEventEditingDidEnd
    }

    CONTROL_STATES = {
      normal:       UIControlStateNormal,
      highlighted:  UIControlStateHighlighted,
      disabled:     UIControlStateDisabled,
      selected:     UIControlStateSelected,
      focused:      UIControlStateFocused
    }

    def blur
      container.resignFirstResponder
    end

    def focus
      container.becomeFirstResponder
    end

    def focus?
      container.isFirstResponder
    end
  end
end
