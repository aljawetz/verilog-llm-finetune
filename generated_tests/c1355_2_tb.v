`timescale 1ns/1ps

module tb_c1355;

  reg G1, G10, G11, G12, G13, G14, G15, G16, G17, G18, G19, G2, G20, G21, G22, G23, G24, G25, G26, G27, G28, G29, G3, G30, G31, G32, G33, G34, G35, G36, G37, G38, G39, G4, G40, G41, G5, G6, G7, G8, G9;
  wire G1324, G1325, G1326, G1327, G1328, G1329, G1330, G1331, G1332, G1333, G1334, G1335, G1336, G1337, G1338, G1339, G1340, G1341, G1342, G1343, G1344, G1345, G1346, G1347, G1348, G1349, G1350, G1351, G1352, G1353, G1354, G1355;

  c1355 uut (
    .G1(G1), .G10(G10), .G11(G11), .G12(G12), .G13(G13), .G14(G14), .G15(G15), .G16(G16), .G17(G17), .G18(G18), .G19(G19), .G2(G2), .G20(G20), .G21(G21), .G22(G22), .G23(G23), .G24(G24), .G25(G25), .G26(G26), .G27(G27), .G28(G28), .G29(G29), .G3(G3), .G30(G30), .G31(G31), .G32(G32), .G33(G33), .G34(G34), .G35(G35), .G36(G36), .G37(G37), .G38(G38), .G39(G39), .G4(G4), .G40(G40), .G41(G41),
    .G1324(G1324), .G1325(G1325), .G1326(G1326), .G1327(G1327), .G1328(G1328), .G1329(G1329), .G1330(G1330), .G1331(G1331), .G1332(G1332), .G1333(G1333), .G1334(G1334), .G1335(G1335), .G1336(G1336), .G1337(G1337), .G1338(G1338), .G1339(G1339), .G1340(G1340), .G1341(G1341), .G1342(G1342), .G1343(G1343), .G1344(G1344), .G1345(G1345), .G1346(G1346), .G1347(G1347), .G1348(G1348), .G1349(G1349), .G1350(G1350), .G1351(G1351), .G1352(G1352), .G1353(G1353), .G1354(G1354), .G1355(G1355)
  );

  initial begin
    // Initialize inputs
    G1 = 0; G10 = 0; G11 = 0; G12 = 0; G13 = 0; G14 = 0; G15 = 0; G16 = 0; G17 = 0; G18 = 0; G19 = 0; 
    G2 = 0; G20 = 0; G21 = 0; G22 = 0; G23 = 0; G24 = 0; G25 = 0; G26 = 0; G27 = 0; G28 = 0; G29 = 0; 
    G3 = 0; G30 = 0; G31 = 0; G32 = 0; G33 = 0; G34 = 0; G35 = 0; G36 = 0; G37 = 0; G38 = 0; G39 = 0; 
    G4 = 0; G40 = 0; G41 = 0; G5 = 0; G6 = 0; G7 = 0; G8 = 0; G9 = 0;

    // Test sequence
    #10; G1 = 1; G2 = 1; G3 = 1; G4 = 1; G5 = 1; G6 = 1; G7 = 1; G8 = 1; G9 = 1; G10 = 1; G11 = 1; G12 = 1; G13 = 1; G14 = 1; G15 = 1; G16 = 1; G17 = 1; G18 = 1; G19 = 1; G20 = 1; G21 = 1; G22 = 1; G23 = 1; G24 = 1; G25 = 1; G26 = 1; G27 = 1; G28 = 1; G29 = 1; G30 = 1; G31 = 1; G32 = 1; G33 = 1; G34 = 1; G35 = 1; G36 = 1; G37 = 1; G38 = 1; G39 = 1; G40 = 1; G41 = 1;
    
    #10; // Wait for outputs to stabilize

    // Check outputs
    if (G1324 !== 1'b0) $display("FAIL: G1324 expected 0, got %b", G1324);
    if (G1325 !== 1'b0) $display("FAIL: G1325 expected 0, got %b", G1325);
    if (G1326 !== 1'b0) $display("FAIL: G1326 expected 0, got %b", G1326);
    if (G1327 !== 1'b0) $display("FAIL: G1327 expected 0, got %b", G1327);
    if (G1328 !== 1'b0) $display("FAIL: G1328 expected 0, got %b", G1328);
    if (G1329 !== 1'b0) $display("FAIL: G1329 expected 0, got %b", G1329);
    if (G1330 !== 1'b0) $display("FAIL: G1330 expected 0, got %b", G1330);
    if (G1331 !== 1'b0) $display("FAIL: G1331 expected 0, got %b", G1331);
    if (G1332 !== 1'b0) $display("FAIL: G1332 expected 0, got %b", G1332);
    if (G1333 !== 1'b0) $display("FAIL: G1333 expected 0, got %b", G1333);
    if (G1334 !== 1'b0) $display("FAIL: G1334 expected 0, got %b", G1334);
    if (G1335 !== 1'b0) $display("FAIL: G1335 expected 0, got %b", G1335);
    if (G1336 !== 1'b0) $display("FAIL: G1336 expected 0, got %b", G1336);
    if (G1337 !== 1'b0) $display("FAIL: G1337 expected 0, got %b", G1337);
    if (G1338 !== 1'b0) $display("FAIL: G1338 expected 0, got %b", G1338);
    if (G1339 !== 1'b0) $display("FAIL: G1339 expected 0, got %b", G1339);
    if (G1340 !== 1'b0) $display("FAIL: G1340 expected 0, got %b", G1340);
    if (G1341 !== 1'b0) $display("FAIL: G1341 expected 0, got %b", G1341);
    if (G1342 !== 1'b0) $display("FAIL: G1342 expected 0, got %b", G1342);
    if (G1343 !== 1'b0) $display("FAIL: G1343 expected 0, got %b", G1343);
    if (G1344 !== 1'b0) $display("FAIL: G1344 expected 0, got %b", G1344);
    if (G1345 !== 1'b0) $display("FAIL: G1345 expected 0, got %b", G1345);
    if (G1346 !== 1'b0) $display("FAIL: G1346 expected 0, got %b", G1346);
    if (G1347 !== 1'b0) $display("FAIL: G1347 expected 0, got %b", G1347);
    if (G1348 !== 1'b0) $display("FAIL: G1348 expected 0, got %b", G1348);
    if (G1349 !== 1'b0) $display("FAIL: G1349 expected 0, got %b", G1349);
    if (G1350 !== 1'b0) $display("FAIL: G1350 expected 0, got %b", G1350);
    if (G1351 !== 1'b0) $display("FAIL: G1351 expected 0, got %b", G1351);
    if (G1352 !== 1'b0) $display("FAIL: G1352 expected 0, got %b", G1352);
    if (G1353 !== 1'b0) $display("FAIL: G1353 expected 0, got %b", G1353);
    if (G1354 !== 1'b0) $display("FAIL: G1354 expected 0, got %b", G1354);
    if (G1355 !== 1'b0) $display("FAIL: G1355 expected 0, got %b", G1355);

    $display("PASS");
    $finish;
  end

endmodule