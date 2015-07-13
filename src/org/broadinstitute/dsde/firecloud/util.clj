(ns org.broadinstitute.dsde.firecloud.util
  (:require [clj-webdriver.taxi :refer :all]))

(def ^:private browser-count (atom 0))

(defn browser-up
  "Start up a browser if it's not already started."
  [url]
  (when (= 1 (swap! browser-count inc))
    (set-driver! {:browser :firefox} url)
    (implicit-wait 60000)))

(defn browser-down
  "If this is the last request, shut the browser down."
  [& {:keys [force] :or {force false}}]
  (when (zero? (swap! browser-count (if force (constantly 0) dec)))
    (quit)))
