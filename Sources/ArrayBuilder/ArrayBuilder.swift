@resultBuilder
public enum ArrayBuilder<Element> {
	@inlinable
	public static func buildBlock() -> [Element] { [] }

	@inlinable
	public static func buildBlock(_ components: [Element]...) -> [Element] { components.flatMap { $0 } }

	@inlinable
	public static func buildEither(first component: [Element]) -> [Element] { component }

	@inlinable
	public static func buildEither(second component: [Element]) -> [Element] { component }

	@inlinable
	public static func buildOptional(_ component: [Element]?) -> [Element] { component ?? [] }

	@inlinable
	public static func buildArray(_ components: [[Element]]) -> [Element] { components.flatMap { $0 } }

	@inlinable
	public static func buildLimitedAvailability(_ component: [Element]) -> [Element] { component }

	@inlinable
	public static func buildExpression(_ expression: Element) -> [Element] { [expression] }

	@inlinable
	public static func buildExpression(_ expression: Element?) -> [Element] { [expression].compactMap { $0 } }

	@inlinable
	public static func buildExpression(_ expression: [Element]) -> [Element] { .init(expression) }

	@inlinable
	public static func buildExpression<S: Sequence<Element>>(_ expression: S) -> [Element] {
		.init(expression)
	}

	@inlinable
	public static func buildExpression<S: Sequence<[Element]>>(_ expression: S) -> [Element] {
		.init(expression.flatMap { $0 })
	}
}

extension Array {
	@inlinable
	public init(@ArrayBuilder<Element> _ build: () -> Self) {
		self = build()
	}
}
