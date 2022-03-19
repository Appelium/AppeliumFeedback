# AppeliumFeedback iOS SDK

[Appelium](https://www.appelium.com) is a platform and a set of tools for improving the quality of mobile apps.

With just a simple shake, your users or beta testers can report bugs or send app feedback and the SDK will automatically capture an environment snapshot of your user's device including all console logs, network requests and even a video prior the bug happened which should provide you with enough details for debugging and fixing bugs faster.

Appelium also provides you with tools for capturing your Automated UI Tests executions in a separate SDK: [AppeliumTests](https://github.com/Appelium/AppeliumTests). This SDK automatically records videos of all of your UI Tests and supplements them with full console logs of your app and the tests runner.

For more info, visit [Appelium.com](https://www.appelium.com).

## Installation

### CocoaPods

To integrate AppeliumFeedback SDK into your Xcode project using [CocoaPods](https://cocoapods.org), add it to your `Podfile`:

```ruby
pod 'AppeliumFeedbackKit'
```

Then, run the following command:

```bash
$ pod install
```

> Already using [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) for logging? Great! Appelium provides an extension which allows you to simply route all logging calls to it without changing a lot of code. Take a look at [AppeliumCocoaLumberjack](https://github.com/Appelium/AppeliumCocoaLumberjack) for integration instructions.

## Usage

1. import AppeliumFeedbackKit framework header in your app delegate

    ```swift
    import AppeliumFeedbackKit
    ```

2. Add the following to your app delegate's `application:didFinishLaunchingWithOptions:` method.
	
	```swift
	AppeliumFeedback.start(apiKey: <#app token#>)
	```
	
	> You can create an `app token` or find an existing one [here](https://dashboard.appelium.com/settings/applications).

### Structured network logs

Appelium supports rich network log capturing. This include structured request and response information like:

- Headers
- Payload
- Duration
- Status codes

By default, this is enabled for all network requests which use `URLSessionConfiguration .default` and `URLSessionConfiguration.ephemeral` configuration.

If you wish to enable network logging for any other/custom session configuration you can simply call:

```swift
let urlSessionConfiguration = ... // Reference to your custom URLSessionConfiguration
AppeliumFeedback.enableLogging(for: urlSessionConfiguration)
```

> If you are already printing network requests information to the console using `NSLog` or `print` statements, you may wish to disable it in order to not to have duplicate logs.

#### Custom request filters

You can enable custom request filters or implement full obfuscation.

	AppeliumFeedback.networkRequestObfuscationHandler = self

And then implement `NetworkRequestObfuscationHandler`:

```swift
func obfuscateNetworkRequest(_ originalRequst: NetworkRequest) -> NetworkRequest? {
    return originalRequst // keeps the request obfuscated
}

func obfuscateNetworkResponse(_ originalResponse: NetworkResponse) -> NetworkResponse? {
    let httpResponse = originalResponse.response as! HTTPURLResponse
    
    let obfuscatedResponse = HTTPURLResponse(
        url: httpResponse.url!, // Additionally you can remove query params, path, port etc
        statusCode: httpResponse.statusCode, // You can modify it as well
        httpVersion: nil,
        headerFields: [:])! // Remove all headers or modify them
    return NetworkResponse(response: obfuscatedResponse, data: nil) // Remove data or modify
}
```

### Console logs

Appelium logs are similar to `NSLog()` and `print()`, but they have the added benefit of having different verbosity levels and can have associated domains. This lets you filter logs better when analyzing them in the Appelium dashboard.

Use Appelium logs through the following methods:

```swift
AppeliumFeedback.logVerbose("Verbose statement")
AppeliumFeedback.logInfo("Info statement")
AppeliumFeedback.logWarning("Warning statement")
AppeliumFeedback.logDebug("Debug statement")
AppeliumFeedback.logError("Error statement")
```

all the logging levels allow you to pass an optional `domain` for even better granularity:

```swift
AppeliumFeedback.logError("Transaction failed", domain: "Payment")
```

### Bug report attachments

If you wish to upload additional files which will be attached to each bug report, you can do that by setting:

	AppeliumFeedback.bugReportingDelegate = self
	
And then implement `BugReportingDelegate`:

```
func additionalBugReportAttachments() -> [BugReportAttachment] {
    return [
        .init(fileName: "db_dump.sqlite", data: FileManager().contents(atPath: "db/main.sqlite")!),
        .init(fileName: "logs.txt", data: FileManager().contents(atPath: "logs/additional.txt")!),
    ]
}
```

> You can upload up to 3 files with each bug report.
