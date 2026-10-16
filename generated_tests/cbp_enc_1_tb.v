`timescale 1ns/1ps

module tb_cbp_enc;

reg [5:0] cbp;
wire [5:0] intra4x4_cbp;
wire [5:0] inter_cbp;

cbp_enc uut (
    .cbp(cbp),
    .intra4x4_cbp(intra4x4_cbp),
    .inter_cbp(inter_cbp)
);

initial begin
    // Test all input values from 0 to 47
    cbp = 6'd0; #10;
    if (intra4x4_cbp !== 6'd3 || inter_cbp !== 6'd0) $display("FAIL: Input 0 failed");
    
    cbp = 6'd1; #10;
    if (intra4x4_cbp !== 6'd29 || inter_cbp !== 6'd2) $display("FAIL: Input 1 failed");
    
    cbp = 6'd2; #10;
    if (intra4x4_cbp !== 6'd30 || inter_cbp !== 6'd3) $display("FAIL: Input 2 failed");
    
    cbp = 6'd3; #10;
    if (intra4x4_cbp !== 6'd17 || inter_cbp !== 6'd7) $display("FAIL: Input 3 failed");
    
    cbp = 6'd4; #10;
    if (intra4x4_cbp !== 6'd31 || inter_cbp !== 6'd4) $display("FAIL: Input 4 failed");
    
    cbp = 6'd5; #10;
    if (intra4x4_cbp !== 6'd18 || inter_cbp !== 6'd8) $display("FAIL: Input 5 failed");
    
    cbp = 6'd6; #10;
    if (intra4x4_cbp !== 6'd37 || inter_cbp !== 6'd17) $display("FAIL: Input 6 failed");
    
    cbp = 6'd7; #10;
    if (intra4x4_cbp !== 6'd8 || inter_cbp !== 6'd13) $display("FAIL: Input 7 failed");
    
    cbp = 6'd8; #10;
    if (intra4x4_cbp !== 6'd32 || inter_cbp !== 6'd5) $display("FAIL: Input 8 failed");
    
    cbp = 6'd9; #10;
    if (intra4x4_cbp !== 6'd38 || inter_cbp !== 6'd18) $display("FAIL: Input 9 failed");
    
    cbp = 6'd10; #10;
    if (intra4x4_cbp !== 6'd19 || inter_cbp !== 6'd9) $display("FAIL: Input 10 failed");
    
    cbp = 6'd11; #10;
    if (intra4x4_cbp !== 6'd9 || inter_cbp !== 6'd14) $display("FAIL: Input 11 failed");
    
    cbp = 6'd12; #10;
    if (intra4x4_cbp !== 6'd20 || inter_cbp !== 6'd10) $display("FAIL: Input 12 failed");
    
    cbp = 6'd13; #10;
    if (intra4x4_cbp !== 6'd10 || inter_cbp !== 6'd15) $display("FAIL: Input 13 failed");
    
    cbp = 6'd14; #10;
    if (intra4x4_cbp !== 6'd11 || inter_cbp !== 6'd16) $display("FAIL: Input 14 failed");
    
    cbp = 6'd15; #10;
    if (intra4x4_cbp !== 6'd2 || inter_cbp !== 6'd11) $display("FAIL: Input 15 failed");
    
    cbp = 6'd16; #10;
    if (intra4x4_cbp !== 6'd16 || inter_cbp !== 6'd1) $display("FAIL: Input 16 failed");
    
    cbp = 6'd17; #10;
    if (intra4x4_cbp !== 6'd33 || inter_cbp !== 6'd32) $display("FAIL: Input 17 failed");
    
    cbp = 6'd18; #10;
    if (intra4x4_cbp !== 6'd34 || inter_cbp !== 6'd33) $display("FAIL: Input 18 failed");
    
    cbp = 6'd19; #10;
    if (intra4x4_cbp !== 6'd21 || inter_cbp !== 6'd36) $display("FAIL: Input 19 failed");
    
    cbp = 6'd20; #10;
    if (intra4x4_cbp !== 6'd35 || inter_cbp !== 6'd34) $display("FAIL: Input 20 failed");
    
    cbp = 6'd21; #10;
    if (intra4x4_cbp !== 6'd22 || inter_cbp !== 6'd37) $display("FAIL: Input 21 failed");
    
    cbp = 6'd22; #10;
    if (intra4x4_cbp !== 6'd39 || inter_cbp !== 6'd44) $display("FAIL: Input 22 failed");
    
    cbp = 6'd23; #10;
    if (intra4x4_cbp !== 6'd4 || inter_cbp !== 6'd40) $display("FAIL: Input 23 failed");
    
    cbp = 6'd24; #10;
    if (intra4x4_cbp !== 6'd36 || inter_cbp !== 6'd35) $display("FAIL: Input 24 failed");
    
    cbp = 6'd25; #10;
    if (intra4x4_cbp !== 6'd40 || inter_cbp !== 6'd45) $display("FAIL: Input 25 failed");
    
    cbp = 6'd26; #10;
    if (intra4x4_cbp !== 6'd23 || inter_cbp !== 6'd38) $display("FAIL: Input 26 failed");
    
    cbp = 6'd27; #10;
    if (intra4x4_cbp !== 6'd5 || inter_cbp !== 6'd41) $display("FAIL: Input 27 failed");
    
    cbp = 6'd28; #10;
    if (intra4x4_cbp !== 6'd24 || inter_cbp !== 6'd39) $display("FAIL: Input 28 failed");
    
    cbp = 6'd29; #10;
    if (intra4x4_cbp !== 6'd6 || inter_cbp !== 6'd42) $display("FAIL: Input 29 failed");
    
    cbp = 6'd30; #10;
    if (intra4x4_cbp !== 6'd7 || inter_cbp !== 6'd43) $display("FAIL: Input 30 failed");
    
    cbp = 6'd31; #10;
    if (intra4x4_cbp !== 6'd1 || inter_cbp !== 6'd19) $display("FAIL: Input 31 failed");
    
    cbp = 6'd32; #10;
    if (intra4x4_cbp !== 6'd41 || inter_cbp !== 6'd6) $display("FAIL: Input 32 failed");
    
    cbp = 6'd33; #10;
    if (intra4x4_cbp !== 6'd42 || inter_cbp !== 6'd24) $display("FAIL: Input 33 failed");
    
    cbp = 6'd34; #10;
    if (intra4x4_cbp !== 6'd43 || inter_cbp !== 6'd25) $display("FAIL: Input 34 failed");
    
    cbp = 6'd35; #10;
    if (intra4x4_cbp !== 6'd25 || inter_cbp !== 6'd20) $display("FAIL: Input 35 failed");
    
    cbp = 6'd36; #10;
    if (intra4x4_cbp !== 6'd44 || inter_cbp !== 6'd26) $display("FAIL: Input 36 failed");
    
    cbp = 6'd37; #10;
    if (intra4x4_cbp !== 6'd26 || inter_cbp !== 6'd21) $display("FAIL: Input 37 failed");
    
    cbp = 6'd38; #10;
    if (intra4x4_cbp !== 6'd46 || inter_cbp !== 6'd46) $display("FAIL: Input 38 failed");
    
    cbp = 6'd39; #10;
    if (intra4x4_cbp !== 6'd12 || inter_cbp !== 6'd28) $display("FAIL: Input 39 failed");
    
    cbp = 6'd40; #10;
    if (intra4x4_cbp !== 6'd45 || inter_cbp !== 6'd27) $display("FAIL: Input 40 failed");
    
    cbp = 6'd41; #10;
    if (intra4x4_cbp !== 6'd47 || inter_cbp !== 6'd47) $display("FAIL: Input 41 failed");
    
    cbp = 6'd42; #10;
    if (intra4x4_cbp !== 6'd27 || inter_cbp !== 6'd22) $display("FAIL: Input 42 failed");
    
    cbp = 6'd43; #10;
    if (intra4x4_cbp !== 6'd13 || inter_cbp !== 6'd29) $display("FAIL: Input 43 failed");
    
    cbp = 6'd44; #10;
    if (intra4x4_cbp !== 6'd28 || inter_cbp !== 6'd23) $display("FAIL: Input 44 failed");
    
    cbp = 6'd45; #10;
    if (intra4x4_cbp !== 6'd14 || inter_cbp !== 6'd30) $display("FAIL: Input 45 failed");
    
    cbp = 6'd46; #10;
    if (intra4x4_cbp !== 6'd15 || inter_cbp !== 6'd31) $display("FAIL: Input 46 failed");
    
    cbp = 6'd47; #10;
    if (intra4x4_cbp !== 6'd0 || inter_cbp !== 6'd12) $display("FAIL: Input 47 failed");

    $display("PASS");
    $finish;
end

endmodule