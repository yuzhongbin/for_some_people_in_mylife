#!/bin/bash
#
# Copyright 2016 . All rights reserved.
# Author: 

SCRIPT_NAME="$(basename ${BASH_SOURCE[0]})"
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"`; pwd)
ROOT_PATH=$(cd $SCRIPT_PATH/..; pwd)
TOOLS_PATH=$(cd $ROOT_PATH/tools; pwd)
CI_SCRIPT_PATH=$(cd $SCRIPT_PATH/ci; pwd)

function usage {
  echo "Analyse changed codes of git commits."
  echo "Usage: ${SCRIPT_NAME} [-b baseline]"
  echo "Example: ${SCRIPT_NAME} -b 1"
  echo
  echo "    -b <baseline> : The baseline of change files, default is 1."
  echo "    -h for help"
  echo
  echo "Results will be saved in subdirectory \"code_analyse\" of git repo root path."
  exit 1
}

BASELINE=1

while getopts b:h FLAG; do
  case $FLAG in
    b) BASELINE=$OPTARG;;
    h) usage;;
    \?)
      echo unrecognized option
      usage
  esac
done
shift $((OPTIND-1))

BASELINE_CHECK_DATA=`echo $BASELINE | bc`
if [ "$BASELINE" != "$BASELINE_CHECK_DATA" ]; then
  echo Please input integral git baseline vesion.
  exit 1
fi

cd $ROOT_PATH

RESULT_PATH=$ROOT_PATH/code_analyse
if [ -d "$RESULT_PATH" ]; then
  rm -rf $RESULT_PATH
fi
mkdir $RESULT_PATH
RESULT_PATH=$(cd $RESULT_PATH; pwd)

# clang-tidy
chmod +x $CI_SCRIPT_PATH/ci_clangtidy.sh
$CI_SCRIPT_PATH/ci_clangtidy.sh -b $BASELINE
if [ $? -ne 0 ]; then
  cp $ROOT_PATH/clang-tidy/clang-tidy-result.txt $RESULT_PATH/
fi
rm -rf $ROOT_PATH/clang-tidy

# codefolder
chmod +x $CI_SCRIPT_PATH/ci_codefolder.sh
$CI_SCRIPT_PATH/ci_codefolder.sh -b $BASELINE
if [ $? -ne 0 ]; then
  cp $ROOT_PATH/codefolder/codefolder-result.txt $RESULT_PATH/
fi
rm -rf $ROOT_PATH/codefolder

# codestyle
chmod +x $CI_SCRIPT_PATH/ci_codestyle.sh
$CI_SCRIPT_PATH/ci_codestyle.sh -b $BASELINE
if [ $? -ne 0 ]; then
  cp $ROOT_PATH/codestyle/codestyle-result.txt $RESULT_PATH/
fi
rm -rf $ROOT_PATH/codestyle

# commitlog
chmod +x $TOOLS_PATH/commitlog/commitlog-gitmerge.sh
$TOOLS_PATH/commitlog/commitlog-gitmerge.sh HEAD HEAD~$BASELINE
if [ $? -ne 0 ]; then
  cp $ROOT_PATH/commitlog/commitlog-result.txt $RESULT_PATH/
fi
rm -rf $ROOT_PATH/commitlog

# simian
chmod +x $CI_SCRIPT_PATH/ci_simian.sh
$CI_SCRIPT_PATH/ci_simian.sh -b $BASELINE
if [ $? -ne 0 ]; then
  cp $ROOT_PATH/simian/simian-result.txt $RESULT_PATH/
fi
rm -rf $ROOT_PATH/simian

# chmod
chmod +x $CI_SCRIPT_PATH/ci_build.sh
chmod +x $CI_SCRIPT_PATH/ci_codecoverage.sh
chmod +x $CI_SCRIPT_PATH/ci_unittest.sh

function build_product {
  product=$1
  $CI_SCRIPT_PATH/ci_build.sh -p ${product}
  result=$?
  if [ ${result} -ne 0 ]; then
    cp ${product}/build_error.txt $RESULT_PATH/${product}_build_error.txt
  fi
}

function run_ut {
  product=$1
  $CI_SCRIPT_PATH/ci_unittest.sh -p ${product}
  result=$?
  if [ ${result} -ne 0 ]; then
    cp ${product}/test_error.txt $RESULT_PATH/${product}_test_error.txt
  fi
  rm -rf $ROOT_PATH/${product}
}

function run_coverage {
  product=$1
  $CI_SCRIPT_PATH/ci_codecoverage.sh -b $BASELINE -p ${product}
  result=$?
  if [ ${result} -ne 0 ]; then
    cp $ROOT_PATH/codecoverage/codecoverage-result.txt $RESULT_PATH/${product}_codecoverage_result.txt
    cp $ROOT_PATH/codecoverage/lcov-info.txt $RESULT_PATH/${product}_lcov_info.txt
    cp $ROOT_PATH/codecoverage/lcov-filter.txt $RESULT_PATH/${product}_lcov_filter.txt
    cp -R $ROOT_PATH/codecoverage/html $RESULT_PATH/${product}_codecoverage_html
  fi
  rm -rf $ROOT_PATH/codecoverage
}

# asan
build_product asan
run_ut asan

# ut32 cov
build_product ut32cov
run_ut ut32cov
run_coverage ut32cov
