##
## License
##
## Copyright (c) 2017 Yu Ishikawa.
##

class BigqueryToDatastore < Formula
  desc "Export a whole BigQuery table to Google Datastore with Apache Beam/Google Dataflow"
  homepage "https://github.com/yu-iskw/bigquery-to-datastore"
  url "https://github.com/yu-iskw/bigquery-to-datastore/archive/0.5.0.tar.gz"
  sha256 "a43755d75e749ab124ab466b4f5f4aac3067d96c7515959acb69d369dcc05a53"

  depends_on :java => "1.8"
  depends_on "maven"

  def install
    # build
    system "make", "package"

    # install
    libexec.install Dir["*"]
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test bigquery-to-datastore`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
