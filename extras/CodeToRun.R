library(CovCoagEmaPrediction)
#=======================
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "~/Downloads/EmaOutput_25p"

# Details for connecting to the server:
dbms <- "you dbms"
user <- 'your username'
pw <- 'your password'
server <- 'your server'
port <- 'your port'

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port,
                                                                pathToDriver = "~/Downloads/jmdcDrivers")

# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- 'cdm database schema'
# Add a sharebale name for the database containing the OMOP CDM data
cdmDatabaseName <- 'CPRD Aurum'
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'work database schema'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'CovCoagEmaPredictionCohort'

# pick the minimum count that will be displayed if creating the shiny app, the validation package, the 
# diagnosis or packaging the results to share 
minCellCount= 5

#======================
# PICK THINGS TO EXECUTE
#=======================
# want to generate a study protocol? Set below to TRUE
createProtocol <- FALSE
# want to generate the cohorts for the study? Set below to TRUE
createCohorts <- FALSE
# want to run a diagnoston on the prediction and explore results? Set below to TRUE
runDiagnostic <- FALSE
viewDiagnostic <- FALSE
# want to run the prediction study? Set below to TRUE
runAnalyses <- FALSE
sampleSize <- NULL # edit this to the number to sample if needed
# want to populate the protocol with the results? Set below to TRUE
createResultsDoc <- FALSE
# want to create a validation package with the developed models? Set below to TRUE
createValidationPackage <- TRUE
analysesToValidate = NULL
# want to package the results ready to share? Set below to TRUE
packageResults <- FALSE
# want to create a shiny app with the results to share online? Set below to TRUE
createShiny <- FALSE
# want to create a journal document with the settings and results populated? Set below to TRUE
createJournalDocument <- FALSE
analysisIdDocument = 1



#=======================

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cdmDatabaseName = cdmDatabaseName,
        cohortDatabaseSchema = cohortDatabaseSchema,
	oracleTempSchema = oracleTempSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        createProtocol = createProtocol,
        createCohorts = createCohorts,
        runDiagnostic = runDiagnostic,
        viewDiagnostic = viewDiagnostic,
        runAnalyses = runAnalyses,
        createResultsDoc = createResultsDoc,
        createValidationPackage = createValidationPackage,
        analysesToValidate = seq(1, 24, 1)[-c(10, 18, 2)],
        skeletonVersion = "v1.0.4",
        packageResults = packageResults,
        minCellCount= minCellCount,
        createShiny = createShiny,
        createJournalDocument = createJournalDocument,
        analysisIdDocument = analysisIdDocument,
        sampleSize = sampleSize)
# [-c(24, 28, 29, 30, 4, 5, 52, 53, 54, 6)]
# Uncomment and run the next line to see the shiny results:
# PatientLevelPrediction::viewMultiplePlp(outputFolder)
