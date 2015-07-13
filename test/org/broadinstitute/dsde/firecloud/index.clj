(ns org.broadinstitute.dsde.firecloud.index
  (:require [clj-webdriver.taxi :refer :all]
            [clojure.test :refer :all]
            [clojure.tools.logging :as log]
            [org.broadinstitute.dsde.firecloud.util :as util]))

(def config (util/load-config))

(deftest home-page-up
  (util/browser-up (get config :default-url))
  (is(present? (find-element {:tag :h1})))
  (log/info (find-element {:tag :h1}))
  (util/browser-down))
