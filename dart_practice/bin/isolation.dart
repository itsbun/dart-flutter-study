// PRACTICE EXERCISE 4: Asynchronous Processing & Isolates & Stream

import 'dart:isolate';

Future<List<int>> fetchLargeNumbers() async {
  print('Loading 1 million data records...');

  await Future.delayed(Duration(seconds: 2));

  return List.generate(1000000, (index) => index + 1);
}

int heavyComputation(List<int> numbers) {
  int totalSum = 0;

  for (var number in numbers) {
    totalSum += number * number;
  }

  return totalSum;
}

Stream<String> trackProgress() async* {
  yield '10%: Connecting to server...';

  await Future.delayed(Duration(milliseconds: 500));

  yield '50%: Analyzing packets...';
  await Future.delayed(Duration(milliseconds: 500));

  yield '100%: Data preparation complete!';
}

void main() async {
  await for (var progress in trackProgress()) {
    print(progress);
  }

  final stopwatch = Stopwatch()..start();

  List<int> rawData = await fetchLargeNumbers();

  print(
    'Downloaded ${rawData.length} items in ${stopwatch.elapsedMilliseconds}ms',
  );

  print('Convert into Isolate...');
  stopwatch.reset();

  int result = await Isolate.run(() {
    return heavyComputation(rawData);
  });

  stopwatch.stop();

  print('Result of computation from Isolate: $result');

  print('Processing time of Isolate: ${stopwatch.elapsedMilliseconds}ms');
}
