/// Abstraction
/// Hiding the complexity

class AcRemote {
  int _temp = 0;

  void increaseTemp() {
    _awakeTheRemoteSystem();
  }

  void decrementTemp() {
    _awakeTheRemoteSystem();
  }

  void _awakeTheRemoteSystem() {
    print('awake system');
    _callTheArduino();
  }

  void _callTheArduino() {
    print('execute command');
    _communicateWithAC();
  }

  void _communicateWithAC() {
    print('Communicating with AC');
    _getResponse();
  }

  void _getResponse() {
    _temp = _temp + 1;
  }

  int get temp {
    return _temp;
  }
}