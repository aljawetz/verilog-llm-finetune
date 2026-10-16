`timescale 1ns/1ps

module tb_c6288;

  reg N1, N18, N35, N52, N69, N86, N103, N120, N137, N154, N171;
  reg N188, N205, N222, N239, N256, N273, N290, N307, N324, N341;
  reg N358, N375, N392, N409, N426, N443, N460, N477, N494, N511, N528;
  wire N545, N1581, N1901, N2223, N2548, N2877, N3211, N3552, N3895;
  wire N4241, N4591, N4946, N5308, N5672, N5971, N6123, N6150, N6160;
  wire N6170, N6180, N6190, N6200, N6210, N6220, N6230, N6240, N6250;
  wire N6260, N6270, N6280, N6287, N6288;

  c6288 uut (
    .N1(N1), .N18(N18), .N35(N35), .N52(N52), .N69(N69), .N86(N86),
    .N103(N103), .N120(N120), .N137(N137), .N154(N154), .N171(N171),
    .N188(N188), .N205(N205), .N222(N222), .N239(N239), .N256(N256),
    .N273(N273), .N290(N290), .N307(N307), .N324(N324), .N341(N341),
    .N358(N358), .N375(N375), .N392(N392), .N409(N409), .N426(N426),
    .N443(N443), .N460(N460), .N477(N477), .N494(N494), .N511(N511),
    .N528(N528), .N545(N545), .N1581(N1581), .N1901(N1901), .N2223(N2223),
    .N2548(N2548), .N2877(N2877), .N3211(N3211), .N3552(N3552), .N3895(N3895),
    .N4241(N4241), .N4591(N4591), .N4946(N4946), .N5308(N5308), .N5672(N5672),
    .N5971(N5971), .N6123(N6123), .N6150(N6150), .N6160(N6160), .N6170(N6170),
    .N6180(N6180), .N6190(N6190), .N6200(N6200), .N6210(N6210), .N6220(N6220),
    .N6230(N6230), .N6240(N6240), .N6250(N6250), .N6260(N6260), .N6270(N6270),
    .N6280(N6280), .N6287(N6287), .N6288(N6288)
  );

  initial begin
    // Initialize inputs
    N1 = 0; N18 = 0; N35 = 0; N52 = 0; N69 = 0; N86 = 0;
    N103 = 0; N120 = 0; N137 = 0; N154 = 0; N171 = 0;
    N188 = 0; N205 = 0; N222 = 0; N239 = 0; N256 = 0;
    N273 = 0; N290 = 0; N307 = 0; N324 = 0; N341 = 0;
    N358 = 0; N375 = 0; N392 = 0; N409 = 0; N426 = 0;
    N443 = 0; N460 = 0; N477 = 0; N494 = 0; N511 = 0; N528 = 0;

    // Test sequence
    #10 N1 = 1; N273 = 1; #10 if (N545 !== 1) $display("FAIL: N545 expected 1, got %b", N545);
    #10 N1 = 0; N273 = 0; #10 if (N545 !== 0) $display("FAIL: N545 expected 0, got %b", N545);
    
    #10 N18 = 1; N290 = 1; #10 if (N1581 !== 1) $display("FAIL: N1581 expected 1, got %b", N1581);
    #10 N18 = 0; N290 = 0; #10 if (N1581 !== 0) $display("FAIL: N1581 expected 0, got %b", N1581);
    
    #10 N35 = 1; N307 = 1; #10 if (N1901 !== 1) $display("FAIL: N1901 expected 1, got %b", N1901);
    #10 N35 = 0; N307 = 0; #10 if (N1901 !== 0) $display("FAIL: N1901 expected 0, got %b", N1901);
    
    #10 N52 = 1; N324 = 1; #10 if (N2223 !== 1) $display("FAIL: N2223 expected 1, got %b", N2223);
    #10 N52 = 0; N324 = 0; #10 if (N2223 !== 0) $display("FAIL: N2223 expected 0, got %b", N2223);
    
    #10 N69 = 1; N341 = 1; #10 if (N2548 !== 1) $display("FAIL: N2548 expected 1, got %b", N2548);
    #10 N69 = 0; N341 = 0; #10 if (N2548 !== 0) $display("FAIL: N2548 expected 0, got %b", N2548);
    
    #10 N86 = 1; N358 = 1; #10 if (N2877 !== 1) $display("FAIL: N2877 expected 1, got %b", N2877);
    #10 N86 = 0; N358 = 0; #10 if (N2877 !== 0) $display("FAIL: N2877 expected 0, got %b", N2877);
    
    #10 N103 = 1; N375 = 1; #10 if (N3211 !== 1) $display("FAIL: N3211 expected 1, got %b", N3211);
    #10 N103 = 0; N375 = 0; #10 if (N3211 !== 0) $display("FAIL: N3211 expected 0, got %b", N3211);
    
    #10 N120 = 1; N392 = 1; #10 if (N3552 !== 1) $display("FAIL: N3552 expected 1, got %b", N3552);
    #10 N120 = 0; N392 = 0; #10 if (N3552 !== 0) $display("FAIL: N3552 expected 0, got %b", N3552);
    
    #10 N137 = 1; N409 = 1; #10 if (N3895 !== 1) $display("FAIL: N3895 expected 1, got %b", N3895);
    #10 N137 = 0; N409 = 0; #10 if (N3895 !== 0) $display("FAIL: N3895 expected 0, got %b", N3895);
    
    #10 N154 = 1; N426 = 1; #10 if (N4241 !== 1) $display("FAIL: N4241 expected 1, got %b", N4241);
    #10 N154 = 0; N426 = 0; #10 if (N4241 !== 0) $display("FAIL: N4241 expected 0, got %b", N4241);
    
    #10 N171 = 1; N443 = 1; #10 if (N4591 !== 1) $display("FAIL: N4591 expected 1, got %b", N4591);
    #10 N171 = 0; N443 = 0; #10 if (N4591 !== 0) $display("FAIL: N4591 expected 0, got %b", N4591);
    
    #10 N188 = 1; N460 = 1; #10 if (N4946 !== 1) $display("FAIL: N4946 expected 1, got %b", N4946);
    #10 N188 = 0; N460 = 0; #10 if (N4946 !== 0) $display("FAIL: N4946 expected 0, got %b", N4946);
    
    #10 N205 = 1; N477 = 1; #10 if (N5308 !== 1) $display("FAIL: N5308 expected 1, got %b", N5308);
    #10 N205 = 0; N477 = 0; #10 if (N5308 !== 0) $display("FAIL: N5308 expected 0, got %b", N5308);
    
    #10 N222 = 1; N494 = 1; #10 if (N5672 !== 1) $display("FAIL: N5672 expected 1, got %b", N5672);
    #10 N222 = 0; N494 = 0; #10 if (N5672 !== 0) $display("FAIL: N5672 expected 0, got %b", N5672);
    
    #10 N239 = 1; N511 = 1; #10 if (N5971 !== 1) $display("FAIL: N5971 expected 1, got %b", N5971);
    #10 N239 = 0; N511 = 0; #10 if (N5971 !== 0) $display("FAIL: N5971 expected 0, got %b", N5971);
    
    #10 N256 = 1; N528 = 1; #10 if (N6123 !== 1) $display("FAIL: N6123 expected 1, got %b", N6123);
    #10 N256 = 0; N528 = 0; #10 if (N6123 !== 0) $display("FAIL: N6123 expected 0, got %b", N6123);
    
    #10 $display("PASS");
    $finish;
  end

endmodule