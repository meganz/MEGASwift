public func withAsyncThrowingValue<T>(in operation: (@escaping (Result<T, Error>) -> Void) -> Void) async throws -> T {
    return try await withCheckedThrowingContinuation { continuation in
        guard Task.isCancelled == false else {
            continuation.resume(throwing: CancellationError())
            return
        }

        operation { result in
            guard Task.isCancelled == false else {
                continuation.resume(throwing: CancellationError())
                return
            }

            continuation.resume(with: result)
        }
    }
}

public func withAsyncValue<T>(in operation: (@escaping (Result<T, Never>) -> Void) -> Void) async -> T {
    await withCheckedContinuation { continuation in
        operation { result in
            continuation.resume(with: result)
        }
    }
}
