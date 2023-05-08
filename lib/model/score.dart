class Score {
  int correct;
  int guess;

  Score({
    this.correct = 0,
    this.guess = 0,
  });

  void answer() {
    guess++;
  }

  void valid() {
    correct++;
  }

  @override
  String toString() {
    return 'GUESS PERCENTAGE : ${(correct / guess).isNaN ? 0 : (correct / guess * 100).round()}%';
  }
}

Score score = Score();
