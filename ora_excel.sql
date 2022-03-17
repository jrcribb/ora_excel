create or replace 
PACKAGE "ORA_EXCEL" IS
   /*
    *  ORAEXCEL version 2.0.39
    *  Documentation and examples available on http://www.oraexcel.com/documentation
    *
    */
    license_key VARCHAR2(100):= '3073450066094029';

    /***************************************************************************
    *
    * FXO.ORA_EXCEL COPYRIGHT AND LEGAL NOTES
    *
    * This software is protected by International copyright Law. Unauthorized use,
    * duplication, reverse engineering, any form of redistribution, or use in part
    * or in whole other than by prior, express, printed and signed license for use
    * is subject to civil and criminal prosecution. If you have received this file
    * in error, please notify copyright holder and destroy this and any other copies
    * as instructed.
    *
    * END-USER LICENSE AGREEMENT FOR ORA_EXCEL IMPORTANT PLEASE READ THE TERMS AND
    * CONDITIONS OF THIS LICENSE AGREEMENT CAREFULLY BEFORE CONTINUING WITH THIS
    * PROGRAM INSTALL: ORA_EXCEL End-User License Agreement ("EULA") is a legal
    * agreement between you (either an individual or a single entity) and ORA_EXCEL.
    * For the ORA_EXCEL software product(s) identified above which may include
    * associated software components, media, printed materials, and "online" or
    * electronic documentation ("ORA_EXCEL"). By installing, copying, or otherwise
    * using the SOFTWARE PRODUCT, you agree to be bound by the terms of this EULA.
    * This license agreement represents the entire agreement concerning the program
    * between you and ORA_EXCEL, (referred to as "licenser"), and it supersedes any
    * prior proposal, representation, or understanding between the parties. If you
    * do not agree to the terms of this EULA, do not install or use the SOFTWARE PRODUCT.
    *
    * The SOFTWARE PRODUCT is protected by copyright laws and international copyright
    * treaties, as well as other intellectual property laws and treaties.
    * The SOFTWARE PRODUCT is licensed, not sold.
    *
    * 1. GRANT OF LICENSE.
    * The SOFTWARE PRODUCT is licensed as follows:
    * (a) Installation and Use.
    * ORA_EXCEL grants you the right to install and use copies of the SOFTWARE PRODUCT
    * on your computer running a validly licensed copy of the operating system for which
    * the SOFTWARE PRODUCT was designed.
    * (b) Backup Copies.
    * You may also make copies of the SOFTWARE PRODUCT as may be necessary for backup
    * and archival purposes.
    *
    * 2. DESCRIPTION OF OTHER RIGHTS AND LIMITATIONS.
    * (a) Maintenance of Copyright Notices.
    * You must not remove or alter any copyright notices on any and all copies of the
    * SOFTWARE PRODUCT.
    * (b) Distribution.
    * You may not distribute registered copies of the SOFTWARE PRODUCT to third parties.
    * Evaluation versions available for download from ORA_EXCEL's websites may be freely
    * distributed.
    * (c) Prohibition on Reverse Engineering, Decompilation, and Disassembly.
    * You may not reverse engineer, decompile, or disassemble the SOFTWARE PRODUCT,
    * except and only to the extent that such activity is expressly permitted by
    * applicable law notwithstanding this limitation.
    * (d) Rental.
    * You may not rent, lease, or lend the SOFTWARE PRODUCT.
    * (e) Support Services.
    * ORA_EXCEL may provide you with support services related to the SOFTWARE PRODUCT
    * ("Support Services"). Any supplemental software code provided to you as part of
    * the Support Services shall be considered part of the SOFTWARE PRODUCT and subject
    * to the terms and conditions of this EULA.
    * (f) Compliance with Applicable Laws.
    * You must comply with all applicable laws regarding use of the SOFTWARE PRODUCT.
    * 3. TERMINATION
    * Without prejudice to any other rights, ORA_EXCEL may terminate this EULA if you
    * fail to comply with the terms and conditions of this EULA. In such event, you must
    * destroy all copies of the SOFTWARE PRODUCT in your possession.
    * 4. COPYRIGHT
    * All title, including but not limited to copyrights, in and to the SOFTWARE PRODUCT
    * and any copies thereof are owned by ORA_EXCEL or its suppliers. All title and
    * intellectual property rights in and to the content which may be accessed through
    * use of the SOFTWARE PRODUCT is the property of the respective content owner and
    * may be protected by applicable copyright or other intellectual property laws and
    * treaties. This EULA grants you no rights to use such content. All rights not
    * expressly granted are reserved by ORA_EXCEL.
    * 5. NO WARRANTIES
    * ORA_EXCEL expressly disclaims any warranty for the SOFTWARE PRODUCT.
    * The SOFTWARE PRODUCT is provided 'As Is' without any express or implied warranty
    * of any kind, including but not limited to any warranties of merchantability,
    * noninfringement, or fitness of a particular purpose. ORA_EXCEL does not warrant
    * or assume responsibility for the accuracy or completeness of any information,
    * text, graphics, links or other items contained within the SOFTWARE PRODUCT.
    * ORA_EXCEL makes no warranties respecting any harm that may be caused by the
    * transmission of a computer virus, worm, time bomb, logic bomb, or other such
    * computer program. ORA_EXCEL further expressly disclaims any warranty or
    * representation to Authorized Users or to any third party.
    * 6. LIMITATION OF LIABILITY
    * In no event shall ORA_EXCEL be liable for any damages (including, without
    * limitation, lost profits, business interruption, or lost information) rising
    * out of 'Authorized Users' use of or inability to use the SOFTWARE PRODUCT,
    * even if ORA_EXCEL has been advised of the possibility of such damages.
    * In no event will ORA_EXCEL be liable for loss of data or for indirect,
    * special, incidental, consequential (including lost profit), or other
    * damages based in contract, tort or otherwise. ORA_EXCEL shall have no
    * liability with respect to the content of the SOFTWARE PRODUCT or any part
    * thereof, including but not limited to errors or omissions contained therein,
    * libel, infringements of rights of publicity, privacy, trademark rights,
    * business interruption, personal injury, loss of privacy, moral rights or
    * the disclosure of confidential information.
    *
    ****************************************************************************/

    TYPE "@1" IS RECORD ("@2" VARCHAR2(2),
                                           "@3" NUMBER,
                                           "@4" INTEGER DEFAULT 0);
    TYPE "@5" IS TABLE OF "@1";
    "@6" "@5" := "@5"();


    TYPE "@7" IS RECORD("@8" VARCHAR2(100));
    TYPE "@9" IS TABLE OF "@7";
    "@10" "@9" := "@9"();

    TYPE "@11" IS RECORD ("@12" VARCHAR2(1000),
                                    "@13" VARCHAR2(10));
    TYPE "@14" IS table OF "@11";
    "@26" "@14" := "@14"();

    TYPE "@728" IS RECORD ("@12" VARCHAR2(1000),
                                             "@13" VARCHAR2(10));
    TYPE "@729" IS table OF "@728";
    "@730" "@729" := "@729"();



    TYPE "@15" IS RECORD ("@16" VARCHAR2(1000),
                                  "@17" VARCHAR2(30),
                                  "@18" NUMBER,
                                  "@19" NUMBER,
                                  "@20" INTEGER,
                                  "@21" INTEGER,
                                  "@22" VARCHAR2(10));
    TYPE "@23" IS TABLE OF "@15";
    "@27" "@23" := "@23"();

    TYPE "@24" IS TABLE OF CLOB;
    "@25" "@24" := "@24"();


    TYPE "@28" IS RECORD ("@29" VARCHAR2(20),
                                      "@30" VARCHAR2(1),
                                      "@31" VARCHAR2(100),
                                      "@32" PLS_INTEGER := 0,
                                      "@33" PLS_INTEGER := 0,
                                      "@34" PLS_INTEGER := 0,
                                      "@35" PLS_INTEGER := 0,
                                      "@36" PLS_INTEGER := 0,
                                      "@37" PLS_INTEGER,
                                      "@38" VARCHAR2(4000),
                                      "@39" BOOLEAN := FALSE,
                                      "@40" BOOLEAN := FALSE,
                                      "@41" BOOLEAN := FALSE,
                                      "@42" VARCHAR2(8),
                                      "@43" VARCHAR2(8),
                                      "@44" VARCHAR2(1),
                                      "@45" VARCHAR2(1),
                                      "@46" BOOLEAN DEFAULT FALSE,
                                      "@47" BOOLEAN DEFAULT FALSE,
                                      "@48" VARCHAR2(6),
                                      "@49" VARCHAR2(8),
                                      "@50" BOOLEAN DEFAULT FALSE,
                                      "@51" VARCHAR2(6),
                                      "@52" VARCHAR2(8),
                                      "@53" BOOLEAN DEFAULT FALSE,
                                      "@54" VARCHAR2(6),
                                      "@55" VARCHAR2(8),
                                      "@56" BOOLEAN DEFAULT FALSE,
                                      "@57" VARCHAR2(6),
                                      "@58" VARCHAR2(8),
                                      "@59" VARCHAR2(10),
                                      "@60" VARCHAR2(8),
                                      "@61" BOOLEAN DEFAULT FALSE,
                                      "@62" BOOLEAN,
                                      "@63" VARCHAR2(2),
                                      "@64" VARCHAR2(2),
                                      "@65" PLS_INTEGER,
                                      "@66" BOOLEAN,
                                      "@67" PLS_INTEGER := 0,
                                      "@68" INTEGER := 0,
                                      "@69" INTEGER := 0,
                                      "@70" INTEGER := 0,
                                      "@370" VARCHAR2(4000));
    "@71" "@28";
    TYPE "@72" IS TABLE OF "@28" INDEX BY PLS_INTEGER;

    "@73" "@72";


    TYPE "@74" IS RECORD ("@75" VARCHAR2(32),
                                "@76" CLOB,
                                "@77" "@24",
                                "@78" PLS_INTEGER,
                                "@79" PLS_INTEGER,
                                "@180" "@5",
                                "@181" "@9",
                                "@80" BOOLEAN DEFAULT FALSE,
                                "@81" NUMBER,
                                "@82" NUMBER,
                                "@83" NUMBER,
                                "@84" NUMBER,
                                "@85" NUMBER,
                                "@86" NUMBER,
                                "@87" VARCHAR2(10),
                                "@88" INTEGER,
                                "@89" VARCHAR2(1000),
                                "@92" VARCHAR2(1000),
                                "@182" "@14",
                                "@731" "@729",
                                "@183" "@23",
                                "@90" VARCHAR2(20),
                                "@91" VARCHAR2(20),
                                "@93" "@72",
                                "@94" NUMBER,
                                "@95" BOOLEAN,
                                "@892" VARCHAR2(20),
                                "@893" VARCHAR2(20));
    TYPE "@96" IS TABLE OF "@74";
    "@97" "@96" := "@96"();



    TYPE "@98" IS RECORD("@184" VARCHAR(60));
    TYPE "@99" IS TABLE OF "@98";
    "@100" "@99" := "@99"();


    TYPE "@101" IS RECORD ("@102" PLS_INTEGER,
                                "@103" PLS_INTEGER,
                                "@104" PLS_INTEGER,
                                "@105" PLS_INTEGER,
                                "@106" PLS_INTEGER,
                                "@107" VARCHAR2(1),
                                "@108" VARCHAR2(1),
                                "@109" BOOLEAN,
                                "@110" INTEGER,
                                "@111" INTEGER,
                                "@112" INTEGER);
    TYPE "@113" IS table OF "@101";
    "@114" "@113" := "@113"();




    TYPE "@115" IS RECORD ("@116" PLS_INTEGER,
                               "@117" VARCHAR2(100),
                               "@118" BOOLEAN := FALSE,
                               "@119" BOOLEAN := FALSE,
                               "@120" BOOLEAN := FALSE,
                               "@121" VARCHAR2(8));
    TYPE "@122" IS table OF "@115";
    "@123" "@122" := "@122"();


    TYPE "@124" IS RECORD ("@125" VARCHAR2(10),
                               "@126" VARCHAR2(8));
    TYPE "@127" IS TABLE OF "@124";
    "@128" "@127" := "@127"();



    TYPE "@129" IS RECORD ("@130" PLS_INTEGER,
                                      "@131" VARCHAR2(100));

    TYPE "@132" IS RECORD ("@133" BOOLEAN DEFAULT FALSE,
                                 "@134" VARCHAR2(6),
                                 "@135" VARCHAR2(8),
                                 "@136" BOOLEAN DEFAULT FALSE,
                                 "@137" VARCHAR2(6),
                                 "@138" VARCHAR2(8),
                                 "@139" BOOLEAN DEFAULT FALSE,
                                 "@140" VARCHAR2(6),
                                 "@141" VARCHAR2(8),
                                 "@142" BOOLEAN DEFAULT FALSE,
                                 "@143" VARCHAR2(6),
                                 "@144" VARCHAR2(8),
                                 "@145" VARCHAR2(10),
                                 "@146" VARCHAR2(8));
    TYPE "@147" IS TABLE OF "@132";
    "@148" "@147" := "@147"();


    TYPE "@149" IS TABLE OF CLOB;
    "@150" "@149" := "@149"();

    TYPE "@753" IS RECORD ("@752" VARCHAR2(20),
                                "@754" VARCHAR2(100),
                                "@755" PLS_INTEGER,
                                "@38" VARCHAR2(4000),
                                "@39" BOOLEAN := FALSE,
                                "@40" BOOLEAN := FALSE,
                                "@41" BOOLEAN := FALSE,
                                "@42" VARCHAR2(8),
                                "@43" VARCHAR2(8),
                                "@44" VARCHAR2(20),
                                "@45" VARCHAR2(20),
                                "@47" BOOLEAN DEFAULT FALSE,
                                "@48" VARCHAR2(6),
                                "@49" VARCHAR2(8),
                                "@50" BOOLEAN DEFAULT FALSE,
                                "@51" VARCHAR2(6),
                                "@52" VARCHAR2(8),
                                "@53" BOOLEAN DEFAULT FALSE,
                                "@54" VARCHAR2(6),
                                "@55" VARCHAR2(8),
                                "@56" BOOLEAN DEFAULT FALSE,
                                "@57" VARCHAR2(6),
                                "@58" VARCHAR2(8),
                                "@756" BOOLEAN,
                                "@59" VARCHAR2(10),
                                "@60" VARCHAR2(8),
                                "@61" BOOLEAN DEFAULT FALSE,
                                "@67" VARCHAR2(60) := NULL,
                                "@68" INTEGER := 0,
                                "@69" INTEGER := 0,
                                "@70" INTEGER := 0,
                                "@764" INTEGER :=0);


    TYPE "@757" IS TABLE OF "@753" INDEX BY VARCHAR2(50);




    TYPE "@151" IS RECORD ("@152" "@96",
                                   "@153" CLOB,
                                   "@154" "@149",
                                   "@155" PLS_INTEGER,
                                   "@156" "@99",
                                   "@157" "@113",
                                   "@158" "@122",
                                   "@159" "@129",
                                   "@160" "@127",
                                   "@161" "@147",
                                   "@162" BOOLEAN,
                                   "@732" BOOLEAN,
                                   "@582" VARCHAR2(1000),
                                   "@758" "@757");
    TYPE "@163" IS TABLE OF "@151";
    "@164" "@163";
    "@165" "@163" := "@163"();


    doc_id PLS_INTEGER := 0;
    current_doc_id PLS_INTEGER;
    current_sheet_id PLS_INTEGER;
    current_row_id PLS_INTEGER;
    "@167" CLOB;
    "@168" PLS_INTEGER;
    "@169" BOOLEAN := FALSE;


    "@170" PLS_INTEGER;
    "@171" VARCHAR2(20);
    "@172" VARCHAR2(20);
    "@173" PLS_INTEGER;

    "@270" NUMBER := 4000;
    "@271" NUMBER := 32767;

    TYPE "@174" IS TABLE OF VARCHAR2(32767) INDEX BY PLS_INTEGER;
    "@175" "@174";

    TYPE "@176" IS TABLE OF VARCHAR2(32767) INDEX BY PLS_INTEGER;
    "@177" "@176";

    TYPE "@178" IS TABLE OF VARCHAR2(32767) INDEX BY PLS_INTEGER;
    "@179" "@178";
    "@300" BLOB := EMPTY_BLOB();
    "@301" CLOB := EMPTY_CLOB();
    "@302" CLOB := EMPTY_CLOB();

    TYPE cell_value_type IS RECORD(value VARCHAR2(32767),
                                   varchar2_value VARCHAR2(32767),
                                   number_value NUMBER,
                                   date_value DATE,
                                   type VARCHAR2(1));
    "@309" INTEGER;
    "@310" CLOB;
    TYPE "@311" IS TABLE OF VARCHAR2(1) INDEX BY PLS_INTEGER;
    "@312" "@311";
    "@313" "@311";
    "@314" VARCHAR2(4);
    "@315" VARCHAR2(30);
    "@452" INTEGER;

    /***************************************************************************
    * Description: Creates new instance of excel document, initializes space
    *  storage and prepares parameters
    *
    * Input Parameters:
    *   - no input parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - doc_id [unique identifier of document]
    *
    ****************************************************************************/
    FUNCTION new_document
    RETURN PLS_INTEGER;



    /***************************************************************************
    * Description: Wrapper procedure of new_document function
    *
    * Input Parameters:
    *   - no input parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE new_document;



    /***************************************************************************
    * Description: Adds new sheet to document
    *
    * Input Parameters:
    *   - sheet_name [sheet name that will be displayed on sheet tab]
    *   - doc_id     [unique identificator od document]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - sheet_id  [unique identificator of sheet within document]
    *
    ****************************************************************************/
    FUNCTION add_sheet(sheet_name VARCHAR2,
                       doc_id PLS_INTEGER DEFAULT current_doc_id)
    RETURN PLS_INTEGER;



    /***************************************************************************
    * Description: Wrapper procedure of add_sheet function
    *
    * Input Parameters:
    *   - sheet_name [sheet name that will be displayed on sheet tab]
    *   - doc_id     [unique identificator of document]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE add_sheet(sheet_name VARCHAR2,
                        doc_id PLS_INTEGER DEFAULT current_doc_id);



    /***************************************************************************
    * Description: Adds row to current or specified sheet
    *
    * Input Parameters:
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - row_id    [unique identificator of row within specified sheed and document]
    *
    ****************************************************************************/
    FUNCTION add_row(doc_id PLS_INTEGER DEFAULT current_doc_id,
                     sheet_id PLS_INTEGER DEFAULT current_sheet_id) RETURN PLS_INTEGER;



    /***************************************************************************
    * Description: Wrapper procedure for add_row function
    *
    * Input Parameters:
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE add_row(doc_id PLS_INTEGER DEFAULT current_doc_id,
                      sheet_id PLS_INTEGER DEFAULT current_sheet_id);



    /***************************************************************************
    * Description: Sets height of speficied row
    *
    * Input Parameters:
    *   - height     [height of the row]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_row_height(height NUMBER,
                             doc_id PLS_INTEGER DEFAULT current_doc_id,
                             sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                             row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets value of numeric cell
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_value (name VARCHAR2,
                              value NUMBER,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets value of string cell
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - value      [date value that will be set to the cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_value (name VARCHAR2,
                              value VARCHAR2,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);

    /***************************************************************************
    * Description: Sets value of cell with internal xml string
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - value      [xml value that will be added to cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_internal_code (name VARCHAR2,
                                      value CLOB,
                                      doc_id PLS_INTEGER DEFAULT current_doc_id,
                                      sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                      row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets value of date cell
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - value      [date value that will be set to the cell]
    *   - doc_id     [unique identificator of document
    *   - sheet_id   [unique identificator of sheet
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_value (name VARCHAR2,
                              value DATE,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets value of big string cell (CLOB)
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_value (name VARCHAR2,
                              value CLOB,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets format of the cell
    *
    * Input Parameters:
    *   - cell_name  [name of the cell on which format will be applied]
    *   - format     [format mask that will be applied to the cell, same as custom format in Excel]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_format (cell_name VARCHAR2,
                               format VARCHAR2,
                               doc_id PLS_INTEGER DEFAULT current_doc_id,
                               sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                               row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Generates Excel document and stores it in BLOB variable
    *
    * Input Parameters:
    *   - blob_file  [BLOB variable where generated Excel will be stored]
    *   - doc_id     [unique identificator of document]
    *
    * Output Parameters:
    *   - blob_file  [BLOB variable where generated Excel will be stored]
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE save_to_blob(blob_file IN OUT BLOB,
                           doc_id PLS_INTEGER DEFAULT current_doc_id);



    /***************************************************************************
    * Description: Sets font family of the cell
    *
    * Input Parameters:
    *   - cell_name  [name of the cell on which format will be applied]
    *   - font_name  [font family which will be applied to the cell ex. Arial]
    *   - font_size  [size that will be applied to the font for specified cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_font(cell_name VARCHAR2,
                            font_name VARCHAR2,
                            font_size PLS_INTEGER DEFAULT 10,
                            doc_id PLS_INTEGER DEFAULT current_doc_id,
                            sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                            row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets default font family for whole document
    *
    * Input Parameters:
    *   - font_name  [font family which will be applied to whole document ex. Arial]
    *   - font_size  [size that will be applied to the font for whole document]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_default_font (font_name VARCHAR2 DEFAULT 'Calibri',
                                font_size PLS_INTEGER DEFAULT 11,
                                doc_id PLS_INTEGER DEFAULT current_doc_id);



    /***************************************************************************
    * Description: Sets cell type to bold
    *
    * Input Parameters:
    *   - name       [name of cell which content will be bolded]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_bold(name VARCHAR2,
                            doc_id PLS_INTEGER DEFAULT current_doc_id,
                            sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                            row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets cell stype to italic
    *
    * Input Parameters:
    *   - name       [name of cell which content will be formated to italic]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_italic(name VARCHAR2,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets cell stype to underline
    *
    * Input Parameters:
    *   - name       [name of cell which content will be underline]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_underline(name VARCHAR2,
                                 doc_id PLS_INTEGER DEFAULT current_doc_id,
                                 sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                 row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets color of font within cell
    *
    * Input Parameters:
    *   - name       [name of cell which font will be colored]
    *   - color      [font color in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_color(name VARCHAR2,
                             color VARCHAR2,
                             doc_id PLS_INTEGER DEFAULT current_doc_id,
                             sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                             row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets background color of cell
    *
    * Input Parameters:
    *   - name       [name of cell which background will be colored]
    *   - color      [background color in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_bg_color(name VARCHAR2,
                                color VARCHAR2,
                                doc_id PLS_INTEGER DEFAULT current_doc_id,
                                sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets left side horizontal alignement of cell
    *
    * Input Parameters:
    *   - name       [name of cell content will be placed to left side of column]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_align_left(name VARCHAR2,
                                 doc_id PLS_INTEGER DEFAULT current_doc_id,
                                 sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                 row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets horizontal alignement of cell to center
    *
    * Input Parameters:
    *   - name       [name of cell content will be centered]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_align_center(name VARCHAR2,
                                    doc_id PLS_INTEGER DEFAULT current_doc_id,
                                    sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                    row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets horizontal alignement of cell to right
    *
    * Input Parameters:
    *   - name       [name of cell content will be placed to right side of column]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_align_right(name VARCHAR2,
                                   doc_id PLS_INTEGER DEFAULT current_doc_id,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                   row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets vertical alignement of cell to top
    *
    * Input Parameters:
    *   - name       [name of cell content will be placed to the top]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_vert_align_top(name VARCHAR2,
                                      doc_id PLS_INTEGER DEFAULT current_doc_id,
                                      sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                      row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets vertical alignement of cell to middle
    *
    * Input Parameters:
    *   - name       [name of cell content will be placed in the middle]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_vert_align_middle(name VARCHAR2,
                                         doc_id PLS_INTEGER DEFAULT current_doc_id,
                                         sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                         row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets vertical alignement of cell to bottom
    *
    * Input Parameters:
    *   - name       [name of cell content will be placed to the bottom]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_vert_align_bottom(name VARCHAR2,
                                         doc_id PLS_INTEGER DEFAULT current_doc_id,
                                         sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                         row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets width of the column
    *
    * Input Parameters:
    *   - name       [name of the column which width will be set to specified value]
    *   - width      [width of column]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_column_width(name VARCHAR2,
                               width NUMBER,
                               doc_id PLS_INTEGER DEFAULT current_doc_id,
                               sheet_id PLS_INTEGER DEFAULT current_sheet_id);



    /***************************************************************************
    * Description: Sets top border of the cell
    *
    * Input Parameters:
    *   - name       [name of cell on which top border will be set]
    *   - style      [style of the border:  thin, thick, double]
    *   - color      [color of border in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_border_top(name VARCHAR2,
                                  style VARCHAR2 DEFAULT 'thin',
                                  color VARCHAR2 DEFAULT '00000000',
                                  doc_id PLS_INTEGER DEFAULT current_doc_id,
                                  sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                  row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets bottom border of the cell
    *
    * Input Parameters:
    *   - name       [name of cell on which bottom border will be set]
    *   - style      [style of the border:  thin, thick, double]
    *   - color      [color of border in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_border_bottom(name VARCHAR2,
                                     style VARCHAR2 DEFAULT 'thin',
                                     color VARCHAR2 DEFAULT '00000000',
                                     doc_id PLS_INTEGER DEFAULT current_doc_id,
                                     sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                     row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets left border of the cell
    *
    * Input Parameters:
    *   - name       [name of cell on which left border will be set]
    *   - style      [style of the border:  thin, thick, double]
    *   - color      [color of border in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_border_left(name VARCHAR2,
                                   style VARCHAR2 DEFAULT 'thin',
                                   color VARCHAR2 DEFAULT '00000000',
                                   doc_id PLS_INTEGER DEFAULT current_doc_id,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                   row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets right border of the cell
    *
    * Input Parameters:
    *   - name       [name of cell on which right border will be set]
    *   - style      [style of the border:  thin, thick, double]
    *   - color      [color of border in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_border_right(name VARCHAR2,
                                    style VARCHAR2 DEFAULT 'thin',
                                    color VARCHAR2 DEFAULT '00000000',
                                    doc_id PLS_INTEGER DEFAULT current_doc_id,
                                    sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                    row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets border of the cell
    *
    * Input Parameters:
    *   - name       [name of cell on which border will be set]
    *   - style      [style of the border:  thin, thick, double]
    *   - color      [color of border in RRGGBB hex format RR - red, GG - green, BB blue]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_border(name VARCHAR2,
                              style VARCHAR2 DEFAULT 'thin',
                              color VARCHAR2 DEFAULT '00000000',
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                              row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Fetches data with speified query and place results on specified
    * or current sheet
    *
    * Input Parameters:
    *   - query             [SQL query whih result will be added to sheet]
    *   - show_column_names [parameter to hide or show column names from SQL query, boolean values TRUE or FALSE]
    *   - doc_id            [unique identificator of document]
    *   - sheet_id          [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE query_to_sheet(query CLOB,
                             show_column_names BOOLEAN DEFAULT TRUE,
                             doc_id PLS_INTEGER DEFAULT current_doc_id,
                             sheet_id PLS_INTEGER DEFAULT current_sheet_id);



    /***************************************************************************
    * Description: Generates Excel document and saves it to physical file in Oracle directory
    *
    * Input Parameters:
    *   - directory_name [name of Oracle directory where Excel document will be saved]
    *   - file_name      [file name of generated Excel document]
    *   - doc_id         [unique identificator of document]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE save_to_file(directory_name VARCHAR2,
                           file_name VARCHAR2,
                           doc_id PLS_INTEGER DEFAULT current_doc_id);



    /***************************************************************************
    * Description: Merges cells horizontaly within specified range
    *
    * Input Parameters:
    *   - cell_from  [name of cell from merge will be started, name example: A1]
    *   - cell_to    [name of cell to where merge will finis, name example: C1]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE merge_cells (cell_from VARCHAR2,
                           cell_to VARCHAR2,
                           doc_id PLS_INTEGER DEFAULT current_doc_id,
                           sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                           row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Wraps text within cell
    *
    * Input Parameters:
    *   - name       [name of cell which text will be wrapped]
    *   - doc_id     [unique identificator of document on which is located sheet
    *                 where is lcaterd row with cell which conted will be wrapped]
    *   - sheet_id   [unique identificator of sheet on which is located row
    *                 row with cell which conted will be wrapped]
    *   - row_id     [unique identificator of row on which cell will be merged]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_wrap_text (name VARCHAR2,
                                  doc_id PLS_INTEGER DEFAULT current_doc_id,
                                  sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                  row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Merges cells vertically within specified range
    *
    * Input Parameters:
    *   - cell_from  [name of cell from merge will be started, name example: A1]
    *   - cell_to    [name of cell to where merge will finis, name example: C1]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE merge_rows (cell_from VARCHAR2,
                          cell_to PLS_INTEGER,
                          doc_id PLS_INTEGER DEFAULT current_doc_id,
                          sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                          row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Sets cell formula
    *
    * Input Parameters:
    *   - name       [name of the cell where value will be added]
    *   - formula    [formula that will be used to calculate cell value]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
        PROCEDURE set_cell_formula(name VARCHAR2,
                                  formula VARCHAR2,
                                  doc_id PLS_INTEGER DEFAULT current_doc_id,
                                  sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                  row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Rotates text to a diagonal angle
    *
    * Input Parameters:
    *   - name       [name of cell content will be centered]
    *   - degrees    [degree from 90 to 180 which will be used to rotate text]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_rotate_text(name VARCHAR2,
                                   degrees INTEGER,
                                   doc_id PLS_INTEGER DEFAULT current_doc_id,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                   row_id PLS_INTEGER DEFAULT current_row_id);



    /***************************************************************************
    * Description: Initiates download of generated excel file using DAD
    *
    * Input Parameters:
    *   - file_name      [file name that will be suggested when download dialog appears]
    *   - doc_id         [unique identificator of document]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE download_file(file_name VARCHAR2,
                            doc_id PLS_INTEGER DEFAULT current_doc_id);



    /***************************************************************************
    * Description: Sets margins of sheet
    *
    * Input Parameters:
    *   - left_margin     [margin size on the left side of sheet]
    *   - right_margin    [margin size on the right side of sheet]
    *   - top_margin      [margin size on the top side of sheet]
    *   - bottom_margin   [margin size on the bottom side of sheet]
    *   - header_margin   [margin size on the header side of sheet]
    *   - footer_margin   [margin size on the footer side of sheet]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_sheet_margins(left_margin NUMBER,
                                right_margin NUMBER,
                                top_margin NUMBER,
                                bottom_margin NUMBER,
                                header_margin NUMBER,
                                footer_margin NUMBER,
                                sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Sets sheet orientation to landscape
    *
    * Input Parameters:
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_sheet_landscape(sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Sets sheet paper size
    *
    * Input Parameters:
    *   - paper_size [paper size of sheet]
    *                Possible values:
    *                   1 - Letter (8-1/2 in. x 11 in.)
    *                   2 - Letter Small (8-1/2 in. x 11 in.)
    *                   3 - Tabloid (11 in. x 17 in.)
    *                   4 - Ledger (17 in. x 11 in.)
    *                   5 - Legal (8-1/2 in. x 14 in.)
    *                   6 - Statement (5-1/2 in. x 8-1/2 in.)
    *                   7 - Executive (7-1/2 in. x 10-1/2 in.)
    *                   8 - A3 (297 mm x 420 mm)
    *                   9 - A4 (210 mm x 297 mm)
    *                   10 - A4 Small (210 mm x 297 mm)
    *                   11 - A5 (148 mm x 210 mm)
    *                   12 - B4 (250 mm x 354 mm)
    *                   13 - A5 (148 mm x 210 mm)
    *                   14 - Folio (8-1/2 in. x 13 in.)
    *                   15 - Quarto (215 mm x 275 mm)
    *                   16 - 10 in. x 14 in.
    *                   17 - 11 in. x 17 in.
    *                   18 - Note (8-1/2 in. x 11 in.)
    *                   19 - Envelope #9 (3-7/8 in. x 8-7/8 in.)
    *                   20 - Envelope #10 (4-1/8 in. x 9-1/2 in.)
    *                   21 - Envelope #11 (4-1/2 in. x 10-3/8 in.)
    *                   22 - Envelope #12 (4-1/2 in. x 11 in.)
    *                   23 - Envelope #14 (5 in. x 11-1/2 in.)
    *                   24 - C size sheet
    *                   25 - D size sheet
    *                   26 - E size sheet
    *                   27 - Envelope DL (110 mm x 220 mm)
    *                   28 - Envelope C5 (162 mm x 229 mm)
    *                   29 - Envelope C3 (324 mm x 458 mm)
    *                   30 - Envelope C4 (229 mm x 324 mm)
    *                   31 - Envelope C6 (114 mm x 162 mm)
    *                   32 - Envelope C65 (114 mm x 229 mm)
    *                   33 - Envelope B4 (250 mm x 353 mm)
    *                   34 - Envelope B5 (176 mm x 250 mm)
    *                   35 - Envelope B6 (176 mm x 125 mm)
    *                   36 - Envelope (110 mm x 230 mm)
    *                   37 - Envelope Monarch (3-7/8 in. x 7-1/2 in.)
    *                   38 - Envelope (3-5/8 in. x 6-1/2 in.)
    *                   39 - U.S. Standard Fanfold (14-7/8 in. x 11 in.)
    *                   40 - German Legal Fanfold (8-1/2 in. x 13 in.)
    *                   41 - German Legal Fanfold (8-1/2 in. x 13 in.)
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_sheet_paper_size(paper_size INTEGER,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Sets sheet header text
    *
    * Input Parameters:
    *   - header_text [text that will be displayed on sheets header, limited to 1000 characters]
    *   - sheet_id    [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_sheet_header_text(header_text VARCHAR2,
                                    sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Sets sheet footer text
    *
    * Input Parameters:
    *   - header_text [text that will be displayed on sheets footer, limited to 1000 characters]
    *   - sheet_id    [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_sheet_footer_text(footer_text VARCHAR2,
                                    sheet_id PLS_INTEGER DEFAULT current_sheet_id);

    /***************************************************************************
    * Description: Sets hyperlink for cell
    *
    * Input Parameters:
    *   - name       [cell name]
    *   - hyperlink  [hyperlink that will be set on cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_hyperlink(name VARCHAR2,
                                 hyperlink VARCHAR2,
                                 doc_id PLS_INTEGER DEFAULT current_doc_id,
                                 sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                 row_id PLS_INTEGER DEFAULT current_row_id);

    /***************************************************************************
    * Description: Sets hyperlink within document, to same or another sheet and
    *              to cell within sheet
    *
    * Input Parameters:
    *   - name       [cell name]
    *   - hyperlink  [hyperlink that will be set on cell, example Sheet1!A1 will
    *                 link to sheet with name Sheet1 and to cell A1 within that
    *                 sheet - if sheet name containst spaces it must be enclosed
    *                 with sigle quotes example: '''My Sheet1''!A1' ]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_internal_hyperlink(name VARCHAR2,
                                          hyperlink VARCHAR2,
                                          doc_id PLS_INTEGER DEFAULT current_doc_id,
                                          sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                          row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets left indent within the cell
    *
    * Input Parameters:
    *   - name       [name of cell content will be indented from the left side]
    *   - indent     [number of indent from left site of cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_indent_left(name VARCHAR2,
                                   indent INTEGER,
                                   doc_id PLS_INTEGER DEFAULT current_doc_id,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                   row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets right indent within the cell
    *
    * Input Parameters:
    *   - name       [name of cell content will be indented from the right side]
    *   - indent     [number of indent from left site of cell]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_indent_right(name VARCHAR2,
                                   indent INTEGER,
                                   doc_id PLS_INTEGER DEFAULT current_doc_id,
                                   sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                                   row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets comment text and author name for cell
    *
    * Input Parameters:
    *   - name                [cell name]
    *   - author              [name of the autor of the comment]
    *   - comment_text        [comment text for the cell]
    *   - comment_box_width   [width of comment box]
    *   - comment_box_height  [height of comment box]
    *   - doc_id              [unique identificator of document]
    *   - sheet_id            [unique identificator of sheet]
    *   - row_id              [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cell_comment(name VARCHAR2,
                               autohr VARCHAR2,
                               comment_text VARCHAR2,
                               comment_box_width NUMBER DEFAULT 100,
                               comment_box_height NUMBER DEFAULT 60,
                               doc_id PLS_INTEGER DEFAULT current_doc_id,
                               sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                               row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Hides column
    *
    * Input Parameters:
    *   - name       [name of the column which will be hidden]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE hide_column(name VARCHAR2,
                          doc_id PLS_INTEGER DEFAULT current_doc_id,
                          sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Hides row
    *
    * Input Parameters:
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *   - row_id     [unique identificator of row]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE hide_row(doc_id PLS_INTEGER DEFAULT current_doc_id,
                       sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                       row_id PLS_INTEGER DEFAULT current_row_id);


    /***************************************************************************
    * Description: Sets column auto filter between defined columns range
    *
    * Input Parameters:
    *   - cell_from  [cell name with row number from which auto filter will start, example: A1]
    *   - cell_to    [cell name with row number where auto filter will end, example: A5]
    *   - doc_id     [unique identificator of document]
    *   - sheet_id   [unique identificator of sheet]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_cells_filter(cell_from VARCHAR2,
                              cell_to VARCHAR2,
                              doc_id PLS_INTEGER DEFAULT current_doc_id,
                              sheet_id PLS_INTEGER DEFAULT current_sheet_id);


    /***************************************************************************
    * Description: Opens Excel file for reading
    *
    * Input Parameters:
    *   - directory_name [name of Oracle directory from where Excel document will be opened]
    *   - file_name      [file name of Excel document]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
     PROCEDURE open_document(directory_name VARCHAR2,
                             file_name VARCHAR2);


    /***************************************************************************
    * Description: Release memory for currently opened document
    *
    * Input Parameters:
    *   - no imput parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
     PROCEDURE close_document;


    /***************************************************************************
    * Description: Loads sheet from opened document
    *
    * Input Parameters:
    *   - sheet_name - [name of sheet case isensitive]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE open_sheet(sheet_name VARCHAR2);


    /***************************************************************************
    * Description: Loads sheet from opened document
    *
    * Input Parameters:
    *   - sheet_id - [numberic index od sheet (ex. 1 = first sheet, 2 = second sheet ...)]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE open_sheet(sheet_id PLS_INTEGER);

    /***************************************************************************
    * Description: Returns cell value
    *
    * Input Parameters:
    *   - cell_name - [cell name which conted will be returned (ex. A1)]
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - cell value type
    *       - varchar2_value  - cell value converted to varchar2 type
    *       - varchar2_number - cell value converted to number type
    *       - varchar2_date   - cell value converted to date type
    *
    ****************************************************************************/

    FUNCTION get_cell_value(cell_name VARCHAR2) RETURN cell_value_type;


    /***************************************************************************
    * Description: Returns last row number from loaded sheet
    *
    * Input Parameters:
    *   - no input parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - last row number
    *
    ****************************************************************************/
    FUNCTION get_last_row RETURN INTEGER;


    /***************************************************************************
    * Description: Set 1904 date system, the first day that is supported is
    *              January 1, 1904
    *
    * Input Parameters:
    *   - no input parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_1904_date_system;


    /***************************************************************************
    * Description: Set 1900 date system, the first day that is supported is
    *              January 1, 1900
    *
    * Input Parameters:
    *   - no input parameters
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE set_1900_date_system;

    /***************************************************************************
    * Description: Set document author property to custom value
    *
    * Input Parameters:
    *   - author - author name
    *   - doc_id - unique identificator of document
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/

    PROCEDURE set_document_author(author VARCHAR2, doc_id PLS_INTEGER DEFAULT current_doc_id);


    /***************************************************************************
    * Description: Add style to current docuemnt
    *
    * Input Parameters:
    *   - style_name            - style name used as referece to apply to cell
    *   - font_name             - font name examples: 'Tahoma', 'Arial', 'Times New Roman'
    *   - font_size             - font size, default 11
    *   - formula               - cell formula
    *   - bold                  - bold cell content
    *   - italic                - italic cell content
    *   - underline             - underline cell content
    *   - color                 - text color in hex, example: red = FF0000
    *   - bg_color              - cell background color in hex, example: grey = CCCCCC
    *   - horizontal_align      - horizontal text alignment, values: 'left', 'center', 'right'
    *   - vertical_align        - vertical text alignment, value: 'top', 'middle', 'bottom'
    *   - border_top            - show cell top border, values: TRUE, FALSE
    *   - border_top_style      - top border style, values: 'thin', 'thick', 'double'
    *   - border_top_color      - top border color in hex, example green = 00FF00
    *   - border_bottom         - show cell bottom border, values: TRUE, FALSE
    *   - border_bottom_style   - bottom border style, values: 'thin', 'thick', 'double'
    *   - border_bottom_color   - bottom border color in hex, example green = 00FF00
    *   - border_left           - show cell left border, values: TRUE, FALSE
    *   - border_left_style     - left border style, values: 'thin', 'thick', 'double'
    *   - border_left_color     - left border color in hex, example green = 00FF00
    *   - border_right          - show cell right border, values: TRUE, FALSE
    *   - border_right_style    - right border style, values: 'thin', 'thick', 'double'
    *   - border_right_color    - right border color in hex, example green = 00FF00
    *   - border                - show all cell borders, values: TRUE, FALSE
    *   - border_style          - all cell borders style, values: 'thin', 'thick', 'double'
    *   - border_color          - all cell borders color in hex, example green = 00FF00
    *   - wrap_text             - wrap text within cell, values: TRUE, FALSE
    *   - format                - format mas for cell
    *   - rotate_text_degree    - degree number for text rotation, values from 0 to 360
    *   - indent_left           - number of indents from left side, values: number greather than zero
    *   - indent_right          - Number of indents from right side, values: number greather than zero
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE add_style (style_name VARCHAR2,
                         font_name VARCHAR2 DEFAULT NULL,
                         font_size PLS_INTEGER DEFAULT NULL,
                         formula VARCHAR2 DEFAULT NULL,
                         bold BOOLEAN DEFAULT FALSE,
                         italic BOOLEAN DEFAULT FALSE,
                         underline BOOLEAN DEFAULT FALSE,
                         color VARCHAR2 DEFAULT NULL,
                         bg_color VARCHAR2 DEFAULT NULL,
                         horizontal_align VARCHAR2 DEFAULT NULL,
                         vertical_align VARCHAR2 DEFAULT NULL,
                         border_top BOOLEAN DEFAULT FALSE,
                         border_top_style VARCHAR2 DEFAULT NULL,
                         border_top_color VARCHAR2 DEFAULT NULL,
                         border_bottom BOOLEAN DEFAULT FALSE,
                         border_bottom_style VARCHAR2 DEFAULT NULL,
                         border_bottom_color VARCHAR2 DEFAULT NULL,
                         border_left BOOLEAN DEFAULT FALSE,
                         border_left_style VARCHAR2 DEFAULT NULL,
                         border_left_color VARCHAR2 DEFAULT NULL,
                         border_right BOOLEAN DEFAULT FALSE,
                         border_right_style VARCHAR2 DEFAULT NULL,
                         border_right_color VARCHAR2 DEFAULT NULL,
                         border BOOLEAN DEFAULT NULL,
                         border_style VARCHAR2 DEFAULT NULL,
                         border_color VARCHAR2 DEFAULT NULL,
                         wrap_text BOOLEAN DEFAULT FALSE,
                         format VARCHAR2 DEFAULT NULL,
                         rotate_text_degree INTEGER DEFAULT NULL,
                         indent_left INTEGER DEFAULT NULL,
                         indent_right INTEGER DEFAULT NULL,
                         column_width INTEGER DEFAULT NULL,
                         doc_id PLS_INTEGER DEFAULT current_doc_id);

    /***************************************************************************
    * Description: Appliest predefined style to cell
    *
    * Input Parameters:
    *   - cell_name  - name of cell, example 'A'
    *   - style_name - name of style defined with procedure add_style
    *   - doc_id     - unique identificator of document
    *   - sheet_id   - unique identificator of sheet
    *   - row_id     - unique identificator of row
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/

    PROCEDURE set_cell_style(cell_name VARCHAR2,
                             style_name VARCHAR2,
                             doc_id PLS_INTEGER DEFAULT current_doc_id,
                             sheet_id PLS_INTEGER DEFAULT current_sheet_id,
                             row_id PLS_INTEGER DEFAULT current_row_id);

        /***************************************************************************
    * Description: Freeze panes horizontally
    *
    * Input Parameters:
    *   - freeze_columns_number  - top left column name with row number,
    *                              example: to freeze first row set 1 as top
    *                              left row
    *   - doc_id                 - unique identificator of document
    *   - sheet_id               - unique identificator of sheet
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE freeze_panes_horizontal(freeze_columns_number VARCHAR2,
                                      doc_id PLS_INTEGER DEFAULT current_doc_id,
                                      sheet_id PLS_INTEGER DEFAULT current_sheet_id);



    /***************************************************************************
    * Description: Freeze panes vertically
    *
    * Input Parameters:
    *   - freeze_rows_number  - top left column name with row number, example:
    *                           to freeze first column set 1 as top left column
    *   - doc_id              - unique identificator of document
    *   - sheet_id            - unique identificator of sheet
    *
    * Output Parameters:
    *   - no output parameters
    *
    * Returns:
    *   - does not return anything
    *
    ****************************************************************************/
    PROCEDURE freeze_panes_vertical(freeze_rows_number VARCHAR2,
                                    doc_id PLS_INTEGER DEFAULT current_doc_id,
                                    sheet_id PLS_INTEGER DEFAULT current_sheet_id);

END ORA_EXCEL; 
/

create or replace 
PACKAGE BODY "ORA_EXCEL" wrapped
a000000
b2
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
2d0eb 7ba5
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 