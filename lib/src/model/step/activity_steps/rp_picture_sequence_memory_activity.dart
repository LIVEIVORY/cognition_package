part of cognition_package_model;

/// Picture Sequence Memory Test
class RPPictureSequenceMemoryActivity extends RPActivityStep {
  RPPictureSequenceMemoryActivity({
    required super.identifier,
    super.includeInstructions,
    super.includeResults,
    this.lengthOfTest = 90,
    this.numberOfTests = 3,
    this.numberOfPics = 3,
  });

  /// Test duration in seconds. Default is 90 seconds.
  int lengthOfTest;

  /// Number of tests to be performed. Default is 3.
  int numberOfTests;

  /// Number of pictures to be displayed. Default is 3.
  int numberOfPics;

  @override
  Widget stepBody(
    dynamic Function(dynamic) onResultChange,
    RPActivityEventLogger eventLogger,
  ) =>
      RPUIPictureSequenceMemoryActivityBody(this, eventLogger, onResultChange);

  /// The results is the list of pairs correcly placed in the test.
  /// The score is the sum of correctly placed pairs.
  @override
  calculateScore(dynamic result) {
    var sum = 0;
    try {
      List<int> pairs = result['pairs'] as List<int>;
      for (int pair in pairs) {
        sum += pair;
      }
    } catch (error) {
      print('$runtimeType - $error');
    }
    return sum;
  }
}
