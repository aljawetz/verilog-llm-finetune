`timescale 1ns/1ps

module tb_Coeff_token_vlc1;

    reg [5:0] addr;
    wire [7:0] vlc_code;

    // Instantiate the module under test (uut)
    Coeff_token_vlc1 uut (
        .addr(addr),
        .vlc_code(vlc_code)
    );

    initial begin
        // Test all address values from 0 to 63
        addr = 6'd0; #10;
        if (vlc_code !== 8'hb5) $display("FAIL: addr=0, expected=8'hb5, got=%h", vlc_code);

        addr = 6'd1; #10;
        if (vlc_code !== 8'h21) $display("FAIL: addr=1, expected=8'h21, got=%h", vlc_code);

        addr = 6'd2; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=2, expected=8'h00, got=%h", vlc_code);

        addr = 6'd3; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=3, expected=8'h00, got=%h", vlc_code);

        addr = 6'd4; #10;
        if (vlc_code !== 8'h75) $display("FAIL: addr=4, expected=8'h75, got=%h", vlc_code);

        addr = 6'd5; #10;
        if (vlc_code !== 8'h74) $display("FAIL: addr=5, expected=8'h74, got=%h", vlc_code);

        addr = 6'd6; #10;
        if (vlc_code !== 8'h32) $display("FAIL: addr=6, expected=8'h32, got=%h", vlc_code);

        addr = 6'd7; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=7, expected=8'h00, got=%h", vlc_code);

        addr = 6'd8; #10;
        if (vlc_code !== 8'h76) $display("FAIL: addr=8, expected=8'h76, got=%h", vlc_code);

        addr = 6'd9; #10;
        if (vlc_code !== 8'ha5) $display("FAIL: addr=9, expected=8'ha5, got=%h", vlc_code);

        addr = 6'd10; #10;
        if (vlc_code !== 8'h95) $display("FAIL: addr=10, expected=8'h95, got=%h", vlc_code);

        addr = 6'd11; #10;
        if (vlc_code !== 8'h53) $display("FAIL: addr=11, expected=8'h53, got=%h", vlc_code);

        addr = 6'd12; #10;
        if (vlc_code !== 8'h77) $display("FAIL: addr=12, expected=8'h77, got=%h", vlc_code);

        addr = 6'd13; #10;
        if (vlc_code !== 8'h65) $display("FAIL: addr=13, expected=8'h65, got=%h", vlc_code);

        addr = 6'd14; #10;
        if (vlc_code !== 8'h55) $display("FAIL: addr=14, expected=8'h55, got=%h", vlc_code);

        addr = 6'd15; #10;
        if (vlc_code !== 8'h43) $display("FAIL: addr=15, expected=8'h43, got=%h", vlc_code);

        addr = 6'd16; #10;
        if (vlc_code !== 8'h47) $display("FAIL: addr=16, expected=8'h47, got=%h", vlc_code);

        addr = 6'd17; #10;
        if (vlc_code !== 8'h66) $display("FAIL: addr=17, expected=8'h66, got=%h", vlc_code);

        addr = 6'd18; #10;
        if (vlc_code !== 8'h56) $display("FAIL: addr=18, expected=8'h56, got=%h", vlc_code);

        addr = 6'd19; #10;
        if (vlc_code !== 8'h64) $display("FAIL: addr=19, expected=8'h64, got=%h", vlc_code);

        addr = 6'd20; #10;
        if (vlc_code !== 8'h78) $display("FAIL: addr=20, expected=8'h78, got=%h", vlc_code);

        addr = 6'd21; #10;
        if (vlc_code !== 8'h67) $display("FAIL: addr=21, expected=8'h67, got=%h", vlc_code);

        addr = 6'd22; #10;
        if (vlc_code !== 8'h57) $display("FAIL: addr=22, expected=8'h57, got=%h", vlc_code);

        addr = 6'd23; #10;
        if (vlc_code !== 8'h85) $display("FAIL: addr=23, expected=8'h85, got=%h", vlc_code);

        addr = 6'd24; #10;
        if (vlc_code !== 8'hfa) $display("FAIL: addr=24, expected=8'hfa, got=%h", vlc_code);

        addr = 6'd25; #10;
        if (vlc_code !== 8'h68) $display("FAIL: addr=25, expected=8'h68, got=%h", vlc_code);

        addr = 6'd26; #10;
        if (vlc_code !== 8'h58) $display("FAIL: addr=26, expected=8'h58, got=%h", vlc_code);

        addr = 6'd27; #10;
        if (vlc_code !== 8'h45) $display("FAIL: addr=27, expected=8'h45, got=%h", vlc_code);

        addr = 6'd28; #10;
        if (vlc_code !== 8'hba) $display("FAIL: addr=28, expected=8'hba, got=%h", vlc_code);

        addr = 6'd29; #10;
        if (vlc_code !== 8'hea) $display("FAIL: addr=29, expected=8'hea, got=%h", vlc_code);

        addr = 6'd30; #10;
        if (vlc_code !== 8'hda) $display("FAIL: addr=30, expected=8'hda, got=%h", vlc_code);

        addr = 6'd31; #10;
        if (vlc_code !== 8'h46) $display("FAIL: addr=31, expected=8'h46, got=%h", vlc_code);

        addr = 6'd32; #10;
        if (vlc_code !== 8'hfb) $display("FAIL: addr=32, expected=8'hfb, got=%h", vlc_code);

        addr = 6'd33; #10;
        if (vlc_code !== 8'haa) $display("FAIL: addr=33, expected=8'haa, got=%h", vlc_code);

        addr = 6'd34; #10;
        if (vlc_code !== 8'h9a) $display("FAIL: addr=34, expected=8'h9a, got=%h", vlc_code);

        addr = 6'd35; #10;
        if (vlc_code !== 8'h48) $display("FAIL: addr=35, expected=8'h48, got=%h", vlc_code);

        addr = 6'd36; #10;
        if (vlc_code !== 8'hbb) $display("FAIL: addr=36, expected=8'hbb, got=%h", vlc_code);

        addr = 6'd37; #10;
        if (vlc_code !== 8'heb) $display("FAIL: addr=37, expected=8'heb, got=%h", vlc_code);

        addr = 6'd38; #10;
        if (vlc_code !== 8'hdb) $display("FAIL: addr=38, expected=8'hdb, got=%h", vlc_code);

        addr = 6'd39; #10;
        if (vlc_code !== 8'hca) $display("FAIL: addr=39, expected=8'hca, got=%h", vlc_code);

        addr = 6'd40; #10;
        if (vlc_code !== 8'h8b) $display("FAIL: addr=40, expected=8'h8b, got=%h", vlc_code);

        addr = 6'd41; #10;
        if (vlc_code !== 8'hab) $display("FAIL: addr=41, expected=8'hab, got=%h", vlc_code);

        addr = 6'd42; #10;
        if (vlc_code !== 8'h9b) $display("FAIL: addr=42, expected=8'h9b, got=%h", vlc_code);

        addr = 6'd43; #10;
        if (vlc_code !== 8'h8a) $display("FAIL: addr=43, expected=8'h8a, got=%h", vlc_code);

        addr = 6'd44; #10;
        if (vlc_code !== 8'hfc) $display("FAIL: addr=44, expected=8'hfc, got=%h", vlc_code);

        addr = 6'd45; #10;
        if (vlc_code !== 8'hec) $display("FAIL: addr=45, expected=8'hec, got=%h", vlc_code);

        addr = 6'd46; #10;
        if (vlc_code !== 8'hdc) $display("FAIL: addr=46, expected=8'hdc, got=%h", vlc_code);

        addr = 6'd47; #10;
        if (vlc_code !== 8'hcb) $display("FAIL: addr=47, expected=8'hcb, got=%h", vlc_code);

        addr = 6'd48; #10;
        if (vlc_code !== 8'hbc) $display("FAIL: addr=48, expected=8'hbc, got=%h", vlc_code);

        addr = 6'd49; #10;
        if (vlc_code !== 8'hac) $display("FAIL: addr=49, expected=8'hac, got=%h", vlc_code);

        addr = 6'd50; #10;
        if (vlc_code !== 8'h9c) $display("FAIL: addr=50, expected=8'h9c, got=%h", vlc_code);

        addr = 6'd51; #10;
        if (vlc_code !== 8'hcc) $display("FAIL: addr=51, expected=8'hcc, got=%h", vlc_code);

        addr = 6'd52; #10;
        if (vlc_code !== 8'h7c) $display("FAIL: addr=52, expected=8'h7c, got=%h", vlc_code);

        addr = 6'd53; #10;
        if (vlc_code !== 8'hbd) $display("FAIL: addr=53, expected=8'hbd, got=%h", vlc_code);

        addr = 6'd54; #10;
        if (vlc_code !== 8'h6c) $display("FAIL: addr=54, expected=8'h6c, got=%h", vlc_code);

        addr = 6'd55; #10;
        if (vlc_code !== 8'h8c) $display("FAIL: addr=55, expected=8'h8c, got=%h", vlc_code);

        addr = 6'd56; #10;
        if (vlc_code !== 8'h9d) $display("FAIL: addr=56, expected=8'h9d, got=%h", vlc_code);

        addr = 6'd57; #10;
        if (vlc_code !== 8'h8d) $display("FAIL: addr=57, expected=8'h8d, got=%h", vlc_code);

        addr = 6'd58; #10;
        if (vlc_code !== 8'had) $display("FAIL: addr=58, expected=8'had, got=%h", vlc_code);

        addr = 6'd59; #10;
        if (vlc_code !== 8'h1c) $display("FAIL: addr=59, expected=8'h1c, got=%h", vlc_code);

        addr = 6'd60; #10;
        if (vlc_code !== 8'h7d) $display("FAIL: addr=60, expected=8'h7d, got=%h", vlc_code);

        addr = 6'd61; #10;
        if (vlc_code !== 8'h6d) $display("FAIL: addr=61, expected=8'h6d, got=%h", vlc_code);

        addr = 6'd62; #10;
        if (vlc_code !== 8'h5d) $display("FAIL: addr=62, expected=8'h5d, got=%h", vlc_code);

        addr = 6'd63; #10;
        if (vlc_code !== 8'h4d) $display("FAIL: addr=63, expected=8'h4d, got=%h", vlc_code);

        // Check default case
        addr = 6'd64; #10; // Out of range
        if (vlc_code !== 8'h00) $display("FAIL: addr=64, expected=8'h00, got=%h", vlc_code);

        $display("PASS");
        $finish;
    end

endmodule