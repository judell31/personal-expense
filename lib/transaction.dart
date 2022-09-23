class Transaction {
  late String id;
  late String title;
  late double amount;
  late DateTime date;

  //Positional or named
  //going with named args here
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date
  });
}