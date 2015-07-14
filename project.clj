(defproject firecloud-ui-browser-tests "0.1.0-SNAPSHOT"
  :description "FireCloud Browser UI Tests"
  :url "https://github.com/broadinstitute/firecloud-ui-browser-tests"
  :license {:name "BSD"
            :url "http://opensource.org/licenses/BSD-3-Clause"}
  :min-lein-version "2.0.0"
  :dependencies [[clj-webdriver "0.6.1"]
                 [org.clojure/clojure "1.5.1"]
                 [org.clojure/core.cache "0.5.0"]
                 [org.clojure/tools.logging "0.2.3"]
                 ;; Exclude these, giving preference to Selenium-WebDriver's
                 ;; dependence on them.
                 [clj-http "0.3.0" :exclusions [org.apache.httpcomponents/httpclient
                                                org.apache.httpcomponents/httpcore
                                                org.apache.httpcomponents/httpmime]]
                 [cheshire "2.1.0"]
                 [org.mortbay.jetty/jetty "6.1.25"]
                 [org.seleniumhq.selenium/selenium-server "2.46.0"]
                 [org.seleniumhq.selenium/selenium-java "2.46.0"]
                 [org.seleniumhq.selenium/selenium-remote-driver "2.46.0"]
                 [com.github.detro/phantomjsdriver "1.2.0"
                  :exclusion [org.seleniumhq.selenium/selenium-java
                              org.seleniumhq.selenium/selenium-server
                              org.seleniumhq.selenium/selenium-remote-driver]]]
  :scm {:url "git@github.com/broadinstitute/firecloud-ui-browser-tests.git"})
