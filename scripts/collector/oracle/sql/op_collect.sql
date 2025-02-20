/*
Copyright 2022 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

set termout on pause on
SET DEFINE "&"
DEFINE SQLDIR=&2
DEFINE v_dodiagnostics=&3
DEFINE EXTRACTSDIR=&SQLDIR/extracts
prompt
prompt ***********************************************************************************
prompt
prompt !!! ATTENTION !!!
prompt
@&SQLDIR/prompt_&v_dodiagnostics
prompt
prompt
prompt ***********************************************************************************
prompt

prompt Initializing Database Migration Assessment Collector...
prompt
set termout off
@@op_collect_init.sql
set termout on
prompt
prompt Initialization completed.


prompt
prompt Collecting Database Migration Assessment data...
prompt

set termout off
@&SQLDIR/op_collect_db_info.sql &SQLDIR

set termout on
prompt Step completed.
prompt
prompt Database Migration Assessment data successfully extracted.
prompt
exit

