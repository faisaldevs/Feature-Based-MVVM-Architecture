import 'package:flutter/material.dart';

class CheckoutProvider extends ChangeNotifier {
  int _activeStep = 0;
  final int _totalSteps = 3;

  int get activeStep => _activeStep;

  void nextStep() {
    if (_activeStep < _totalSteps - 1) {
      _activeStep++;
      notifyListeners();
    }
  }

  void previousStep(BuildContext context) {
    if (_activeStep > 0) {
      _activeStep--;
    } else {
      Navigator.pop(context);
    }
    notifyListeners();
  }

  void setStep(int step) {
    if (step >= 0 && step < _totalSteps) {
      _activeStep = step;
      notifyListeners();
    }
  }

  void resetSteps() {
    _activeStep = 0;
    notifyListeners();
  }
}
