require "logger"

logger = Logger.new(STDOUT)
logger.level = "error"

logger.debug("I am looking for a sister")
logger.info("Don't judge me")
logger.warn("Chioma my lover")
logger.fatal("E ma da mi duro")