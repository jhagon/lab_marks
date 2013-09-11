# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
LabMarks::Application.initialize!

# Set up some global constants.

# First, define mark criteria.

MARK1_CRITERION = "Answers to questions."
MARK2_CRITERION = "Style/completeness of write-up."
MARK3_CRITERION = "Quality of spectra annotation."
MARK4_CRITERION = "Results."

# Set number of criteria

NUM_CRITERIA = 4

# Now, the number of marks available per criteria.
MARK_UNIT = 5

# Default PER_PAGE for pagination.

WillPaginate.per_page = 10
