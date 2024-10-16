// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import XCTest
import RxSwift
@testable import StarterApp


// MARK: - ViewCharactersListUseCaseProtocol

open class ViewCharactersListUseCaseProtocolMock: ViewCharactersListUseCaseProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getCharactersList(disposeBag: DisposeBag) -> Observable<MarverCharactersResponseEntity> {
        addInvocation(.m_getCharactersList__disposeBag_disposeBag(Parameter<DisposeBag>.value(`disposeBag`)))
		let perform = methodPerformValue(.m_getCharactersList__disposeBag_disposeBag(Parameter<DisposeBag>.value(`disposeBag`))) as? (DisposeBag) -> Void
		perform?(`disposeBag`)
		var __value: Observable<MarverCharactersResponseEntity>
		do {
		    __value = try methodReturnValue(.m_getCharactersList__disposeBag_disposeBag(Parameter<DisposeBag>.value(`disposeBag`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCharactersList(disposeBag: DisposeBag). Use given")
			Failure("Stub return value not specified for getCharactersList(disposeBag: DisposeBag). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getCharactersList__disposeBag_disposeBag(Parameter<DisposeBag>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getCharactersList__disposeBag_disposeBag(let lhsDisposebag), .m_getCharactersList__disposeBag_disposeBag(let rhsDisposebag)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsDisposebag, rhs: rhsDisposebag, with: matcher), lhsDisposebag, rhsDisposebag, "disposeBag"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getCharactersList__disposeBag_disposeBag(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getCharactersList__disposeBag_disposeBag: return ".getCharactersList(disposeBag:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getCharactersList(disposeBag: Parameter<DisposeBag>, willReturn: Observable<MarverCharactersResponseEntity>...) -> MethodStub {
            return Given(method: .m_getCharactersList__disposeBag_disposeBag(`disposeBag`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCharactersList(disposeBag: Parameter<DisposeBag>, willProduce: (Stubber<Observable<MarverCharactersResponseEntity>>) -> Void) -> MethodStub {
            let willReturn: [Observable<MarverCharactersResponseEntity>] = []
			let given: Given = { return Given(method: .m_getCharactersList__disposeBag_disposeBag(`disposeBag`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<MarverCharactersResponseEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getCharactersList(disposeBag: Parameter<DisposeBag>) -> Verify { return Verify(method: .m_getCharactersList__disposeBag_disposeBag(`disposeBag`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getCharactersList(disposeBag: Parameter<DisposeBag>, perform: @escaping (DisposeBag) -> Void) -> Perform {
            return Perform(method: .m_getCharactersList__disposeBag_disposeBag(`disposeBag`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

