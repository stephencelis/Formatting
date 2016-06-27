public func format<A>(_ formatter: Formatter<String, (A) -> String>, _ a: A) -> String {
  return format(formatter)(a)
}

public func format<A, B>(_ formatter: Formatter<String, (A) -> (B) -> String>, _ a: A, _ b: B) -> String {
  return format(formatter)(a)(b)
}

public func format<A, B, C>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> String>, _ a: A, _ b: B, _ c: C) -> String {
  return format(formatter)(a)(b)(c)
}

public func format<A, B, C, D>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> String>, _ a: A, _ b: B, _ c: C, _ d: D) -> String {
  return format(formatter)(a)(b)(c)(d)
}

public func format<A, B, C, D, E>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> String {
  return format(formatter)(a)(b)(c)(d)(e)
}

public func format<A, B, C, D, E, F>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)
}

public func format<A, B, C, D, E, F, G>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)
}

public func format<A, B, C, D, E, F, G, H>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)
}

public func format<A, B, C, D, E, F, G, H, I>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)(i)
}

public func format<A, B, C, D, E, F, G, H, I, J>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)
}

public func format<A, B, C, D, E, F, G, H, I, J, K>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)
}

public func format<A, B, C, D, E, F, G, H, I, J, K, L>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)
}

public func format<A, B, C, D, E, F, G, H, I, J, K, L, M>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M) -> String {
  return format(formatter)(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)(m)
}

public func print<A>(_ formatter: Formatter<String, (A) -> String>, _ a: A) {
  print(format(formatter, a))
}

public func print<A, B>(_ formatter: Formatter<String, (A) -> (B) -> String>, _ a: A, _ b: B) {
  print(format(formatter, a, b))
}

public func print<A, B, C>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> String>, _ a: A, _ b: B, _ c: C) {
  print(format(formatter, a, b, c))
}

public func print<A, B, C, D>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> String>, _ a: A, _ b: B, _ c: C, _ d: D) {
  print(format(formatter, a, b, c, d))
}

public func print<A, B, C, D, E>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E) {
  print(format(formatter, a, b, c, d, e))
}

public func print<A, B, C, D, E, F>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) {
  print(format(formatter, a, b, c, d, e, f))
}

public func print<A, B, C, D, E, F, G>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G) {
  print(format(formatter, a, b, c, d, e, f, g))
}

public func print<A, B, C, D, E, F, G, H>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H) {
  print(format(formatter, a, b, c, d, e, f, g, h))
}

public func print<A, B, C, D, E, F, G, H, I>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I) {
  print(format(formatter, a, b, c, d, e, f, g, h, i))
}

public func print<A, B, C, D, E, F, G, H, I, J>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J) {
  print(format(formatter, a, b, c, d, e, f, g, h, i, j))
}

public func print<A, B, C, D, E, F, G, H, I, J, L>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (L) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ l: L) {
  print(format(formatter, a, b, c, d, e, f, g, h, i, j, l))
}

public func print<A, B, C, D, E, F, G, H, I, J, L, M>(_ formatter: Formatter<String, (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (L) -> (M) -> String>, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ l: L, _ m: M) {
  print(format(formatter, a, b, c, d, e, f, g, h, i, j, l, m))
}

// MARK:

public func format<A>(_ formatter: () -> Formatter<String, (A) -> String>, _ a: A) -> String {
  return format(formatter)(a)
}

public func print<A>(_ formatter: () -> Formatter<String, (A) -> String>, _ a: A) {
  print(format(formatter, a))
}
