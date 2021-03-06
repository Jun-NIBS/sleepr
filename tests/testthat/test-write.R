context("Writing records")

test_that("Writing all channels and overwriting with events", {
  
  # First write
  write_mdf(edfPath = "data/subject1.edf",
            mdfPath = "data/sample")
  expect_equal(length(list.dirs("data/sample")), 91)
  
  # Overwrite
  events <- read_events_noxturnal("data/noxturnal_events_example_unicode.csv")
  write_mdf(edfPath = "data/subject1.edf",
            mdfPath = "data/sample",
            channels = c("Activity","Airflow"),
            events = read_events_noxturnal("data/noxturnal_events_example_unicode.csv"))
  expect_equal(length(list.dirs("data/sample")), 3)
  
  events.write <- jsonlite::read_json("data/sample/events.json",simplifyVector = TRUE)
  expect_equal(length(events.write), length(events))
  expect_equal(nrow(events.write), nrow(events))
})

test_that("Do not write channels", {
  write_mdf(edfPath = "data/subject1.edf",
            mdfPath = "data/sample",
            channels = c())
  expect_equal(length(list.dirs("data/sample")), 1)
  unlink("data/sample", recursive = TRUE)
})

test_that("Corrupted channel", {
  expect_warning({
    write_channel(channel = "Corrupted",
                  signals = c(),
                  headers = edfReader::readEdfSignals("data/subject1.edf"),
                  mdfPath = "data/",
                  endian = "little")
  })
})

test_that("Read file", {
  write_mdf(edfPath = "data/subject1.edf",
            mdfPath = "data/sample",
            channels = c(),
            events = read_events_noxturnal("data/noxturnal_events_example_unicode.csv"))
  r <- read_mdf("data/sample",channels = c())
  unlink("data/sample",recursive = TRUE)
})


