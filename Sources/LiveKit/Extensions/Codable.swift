/*
 * Copyright 2025 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

extension Encodable {
    func mapped<T: Decodable>(to type: T.Type,
                              encoder: JSONEncoder = JSONEncoder(),
                              decoder: JSONDecoder = JSONDecoder()) -> T?
    {
        guard let encoded = try? encoder.encode(self),
              let decoded = try? decoder.decode(type, from: encoded) else { return nil }

        return decoded
    }
}
