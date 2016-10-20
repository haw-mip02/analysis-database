FROM tutum/mongodb:3.2
# tutum/mongodb will be deprecated soon, but there an alternative mongod
# dockerfile, which failed to start properly and was lacking several options
# including user setup

MAINTAINER Niklas Voss version: 0.1

# NOTE: no customization necessary atm