RF_FW_SOURCES = \
	Framework/DetourHelpers.cs	\
	Framework/key_v1.cs	\
	Framework/LoaderClass.cs	\
	Framework/ReliabilityConfiguration.cs	\
	Framework/ReliabilityFramework.cs	\
	Framework/ReliabilityTest.cs	\
	Framework/ReliabilityTestSet.cs	\
	Framework/RFLogging.cs	\
	KShims.cs

GC_TESTS_SRC = \
	Tests/573277.cs	\
	Tests/MulDimJagAry.cs	\
	Tests/bestfit-finalize.cs	\
	Tests/ExpandHeap.cs	\
	Tests/PlugGaps.cs	\
	Tests/concurrentspin2.cs	\
	Tests/GCQueue.cs	\
	Tests/SingLinkStay.cs	\
	Tests/GCSimulator.cs	\
	Tests/StressAllocator.cs	\
	Tests/doubLinkStay.cs	\
	Tests/GCVariant.cs	\
	Tests/ThdTreeGrowingObj.cs	\
	Tests/allocationwithpins.cs	\
	Tests/pinstress.cs	\
	Tests/LeakGenThrd.cs	\
	Tests/b115557.cs	\
	Tests/plug.cs

GC_TESTS=$(GC_TESTS_SRC:.cs=.exe)

%.exe: %.cs
	mcs -out:$@ $<

ReliabilityFramework.exe: $(RF_FW_SOURCES) $(GC_TESTS)
	mcs -out:$@ -d:PROJECTK_BUILD $(RF_FW_SOURCES)

all: ReliabilityFramework.exe .stamp-tests
