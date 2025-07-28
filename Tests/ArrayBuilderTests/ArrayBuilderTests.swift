import Testing
@testable import ArrayBuilder

@Suite
struct ArrayBuilderTests {
	func build<T>(
		with range: ClosedRange<Int>,
		@ArrayBuilder<T> _ f: (Int) -> [T]
	) -> [T] {
		return range.flatMap(f)
	}

	@Test
	func buildEmpty() async throws {
		#expect(
			Array<Int> { }
			== []
		)

		#expect(
			Array<Int> { [] }
			== []
		)
	}

	@Test
	func buildSimple() async throws {
		#expect(
			Array {
				1
				2
				3
			}
			== [1,2,3]
		)
	}

	@Test
	func buildNested() async throws {
		#expect(
			Array<Int> {
				1
				[2, 3, 4]
				Array {
					5
					[[6], [7, 8]] // double nesting
					9
					[]
				}
			}
			== [1,2,3,4,5,6,7,8,9]
		)
	}

	@Test
	func buildIf() async throws {
		#expect(
			Array {
				1

				if true {
					2
				}

				if false {
					3
				}

				if false {
					4
				} else {
					5
				}

				if true {} else { 6 }

				if false {} else if true { 7 }
			}
			== [1,2,5,7]
		)
	}

	@Test
	func buildSwitch() async throws {
		#expect(
			build(with: 1...5) { i in
				switch i {
				case 1: "one"
				case 2: "two"
				case 3: "three"
				case 4: "four"
				case 5: [] // ignore 5
				default: "unexpected"
				}
			}
			== ["one","two","three","four"]
		)
	}

	@Test
	func buildOptional() async throws {
		#expect(
			Array {
				1
				Int?.some(2)
				Int?.none
				4
			}
			== [1,2,4]
		)
	}
}
