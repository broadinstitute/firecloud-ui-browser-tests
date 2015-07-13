# firecloud-ui-browser-tests

## Dependencies

* [Leiningen](http://leiningen.org/)

## References

* [Taxi API for browser testing](https://github.com/semperos/clj-webdriver/wiki/Introduction%3A-Taxi)
* [Clojure Test Framework](https://clojure.github.io/clojure/clojure.test-api.html)
* [Leiningen and Clojure](http://alexott.net/en/clojure/ClojureLein.html)
* [Cursive Intellij Plugin](https://cursiveclojure.com/userguide/index.html)

### Run all tests:

    lein clean
    lein test

### Sample Output:

    lein test org.broadinstitute.dsde.firecloud.index
    Jul 13, 2015 12:32:42 PM org.broadinstitute.dsde.firecloud.index invoke0
    INFO: #clj_webdriver.element.Element{:webelement #<Tag: <h1>, Text: Login via Google Apps, Object: [[FirefoxDriver: firefox on MAC (72ba0d61-6414-984d-816e-912451956de9)] -> xpath: //h1]>}

