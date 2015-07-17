# firecloud-ui-browser-tests

## Dependencies

* [Leiningen](http://leiningen.org/)

## References

* [Taxi API for browser testing](https://github.com/semperos/clj-webdriver/wiki/Introduction%3A-Taxi)
* [Clojure Test Framework](https://clojure.github.io/clojure/clojure.test-api.html)
* [Leiningen and Clojure](http://alexott.net/en/clojure/ClojureLein.html)
* [Cursive Intellij Plugin](https://cursiveclojure.com/userguide/index.html)
* [Chrome Drivers](http://chromedriver.storage.googleapis.com/index.html)

### Testing

Testing can be done locally by running a script that will download the chrome driver file and run the tests 
pointing to that driver:

    lein clean
    ./scripts/test.sh mac
    
Alternatively, the tests can be run from the docker file. To do this, you'll need a working instance of 
docker (and boot2docker for mac users) installed. Make sure docker is up and responding before trying to run
the docker shell command.
     
* [Docker Getting Started](https://docs.docker.com/mac/started/)
* [Boot2Docker Installation](https://docs.docker.com/mac/step_one/)
* [Docker Reference](http://docs.docker.com/reference/builder/)

Boot2Docker does not like our vpn client, Cisco AnyConnect. If you run into timeout issues, see this SO post:
[http://stackoverflow.com/questions/26686358/docker-cant-connect-to-boot2docker-because-of-tcp-timeout](http://stackoverflow.com/questions/26686358/docker-cant-connect-to-boot2docker-because-of-tcp-timeout)

The command for running tests using in docker is

    ./scripts/test.sh docker                   

### Sample Output:

    ####################
    ## Testing on Mac ##
    ####################
    
    Archive:  target/driver.zip
      inflating: chromedriver            
    
    lein test org.broadinstitute.dsde.firecloud.index
    Starting ChromeDriver 2.15.322455 (ae8db840dac8d0c453355d3d922c91adfb61df8f) on port 18300
    Only local connections are allowed.
    Jul 14, 2015 12:44:17 PM org.broadinstitute.dsde.firecloud.index invoke0
    INFO: #clj_webdriver.element.Element{:webelement #<Tag: <h1>, Text: Login via Google Apps, Object: [[ChromeDriver: chrome on MAC (8303484c505c005d234bb60ab7c0c0ec)] -> xpath: //h1]>}
    
    Ran 1 tests containing 1 assertions.
    0 failures, 0 errors.
    
## Default Testing URLs

The default url for testing is defined in `resources/config.edn`. Update that file to test against a different
urls, such as localhost, development, or production.    
    
## Notes on Chrome Testing

Chrome testing requires a binary chrome driver file (os specific versions are included in the resources directory).
One can run tests without those by running against firefox. Firefox is better-supported by Selenium than other
browsers, but DSDE has chosen Chrome as the supported browser so we do need to test against Chrome as a priority
and other browsers if needed. In `org.broadinstitute.dsde.firecloud.util.clj`, change `chrome` to `firefox`. 

*Note:* Changing the browser from chrome to firefox may break the docker build as it is customized for chrome.

Separate profiles are configured for each major platform, linux, mac, and win. Run all tests with the profile 
specific to your environment:

* `./scripts/test.sh docker`
* `./scripts/test.sh mac`
* `./scripts/test.sh win`

There is a bug in the latest version (2.16) of the chrome drivers that work with the latest selenium libraries.