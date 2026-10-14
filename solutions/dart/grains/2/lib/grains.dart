BigInt square(final int n) => (n <= 0 || n > 64) ? throw ArgumentError('square must be between 1 and 64') : BigInt.two.pow(n - 1);

BigInt total() => BigInt.two.pow(64) - BigInt.one;
