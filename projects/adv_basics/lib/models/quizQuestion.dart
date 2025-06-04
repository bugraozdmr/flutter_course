class Quizquestion {
  const Quizquestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // kopyaladı
    final shuffledList = List.of(answers);
    // karıştırır
    shuffledList.shuffle();
    return shuffledList;
  }
}
