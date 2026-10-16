`timescale 1ns/1ps

module tb_Coeff_token_vlc2;

    reg [5:0] addr;
    wire [7:0] vlc_code;

    // Instantiate the module under test
    Coeff_token_vlc2 uut (
        .addr(addr),
        .vlc_code(vlc_code)
    );

    initial begin
        // Test all addresses from 0 to 63
        addr = 6'd0; #10;
        if (vlc_code !== 8'hf5) $display("FAIL: addr=0, expected=0xf5, got=%h", vlc_code);
        
        addr = 6'd1; #10;
        if (vlc_code !== 8'he3) $display("FAIL: addr=1, expected=0xe3, got=%h", vlc_code);
        
        addr = 6'd2; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=2, expected=0x00, got=%h", vlc_code);
        
        addr = 6'd3; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=3, expected=0x00, got=%h", vlc_code);
        
        addr = 6'd4; #10;
        if (vlc_code !== 8'hb5) $display("FAIL: addr=4, expected=0xb5, got=%h", vlc_code);
        
        addr = 6'd5; #10;
        if (vlc_code !== 8'hf4) $display("FAIL: addr=5, expected=0xf4, got=%h", vlc_code);
        
        addr = 6'd6; #10;
        if (vlc_code !== 8'hd3) $display("FAIL: addr=6, expected=0xd3, got=%h", vlc_code);
        
        addr = 6'd7; #10;
        if (vlc_code !== 8'h00) $display("FAIL: addr=7, expected=0x00, got=%h", vlc_code);
        
        addr = 6'd8; #10;
        if (vlc_code !== 8'h85) $display("FAIL: addr=8, expected=0x85, got=%h", vlc_code);
        
        addr = 6'd9; #10;
        if (vlc_code !== 8'hc4) $display("FAIL: addr=9, expected=0xc4, got=%h", vlc_code);
        
        addr = 6'd10; #10;
        if (vlc_code !== 8'he4) $display("FAIL: addr=10, expected=0xe4, got=%h", vlc_code);
        
        addr = 6'd11; #10;
        if (vlc_code !== 8'hc3) $display("FAIL: addr=11, expected=0xc3, got=%h", vlc_code);
        
        addr = 6'd12; #10;
        if (vlc_code !== 8'hf6) $display("FAIL: addr=12, expected=0xf6, got=%h", vlc_code);
        
        addr = 6'd13; #10;
        if (vlc_code !== 8'ha4) $display("FAIL: addr=13, expected=0xa4, got=%h", vlc_code);
        
        addr = 6'd14; #10;
        if (vlc_code !== 8'hb4) $display("FAIL: addr=14, expected=0xb4, got=%h", vlc_code);
        
        addr = 6'd15; #10;
        if (vlc_code !== 8'hb3) $display("FAIL: addr=15, expected=0xb3, got=%h", vlc_code);
        
        addr = 6'd16; #10;
        if (vlc_code !== 8'hb6) $display("FAIL: addr=16, expected=0xb6, got=%h", vlc_code);
        
        addr = 6'd17; #10;
        if (vlc_code !== 8'h84) $display("FAIL: addr=17, expected=0x84, got=%h", vlc_code);
        
        addr = 6'd18; #10;
        if (vlc_code !== 8'h94) $display("FAIL: addr=18, expected=0x94, got=%h", vlc_code);
        
        addr = 6'd19; #10;
        if (vlc_code !== 8'ha3) $display("FAIL: addr=19, expected=0xa3, got=%h", vlc_code);
        
        addr = 6'd20; #10;
        if (vlc_code !== 8'h96) $display("FAIL: addr=20, expected=0x96, got=%h", vlc_code);
        
        addr = 6'd21; #10;
        if (vlc_code !== 8'he5) $display("FAIL: addr=21, expected=0xe5, got=%h", vlc_code);
        
        addr = 6'd22; #10;
        if (vlc_code !== 8'hd5) $display("FAIL: addr=22, expected=0xd5, got=%h", vlc_code);
        
        addr = 6'd23; #10;
        if (vlc_code !== 8'h93) $display("FAIL: addr=23, expected=0x93, got=%h", vlc_code);
        
        addr = 6'd24; #10;
        if (vlc_code !== 8'h86) $display("FAIL: addr=24, expected=0x86, got=%h", vlc_code);
        
        addr = 6'd25; #10;
        if (vlc_code !== 8'ha5) $display("FAIL: addr=25, expected=0xa5, got=%h", vlc_code);
        
        addr = 6'd26; #10;
        if (vlc_code !== 8'h95) $display("FAIL: addr=26, expected=0x95, got=%h", vlc_code);
        
        addr = 6'd27; #10;
        if (vlc_code !== 8'h83) $display("FAIL: addr=27, expected=0x83, got=%h", vlc_code);
        
        addr = 6'd28; #10;
        if (vlc_code !== 8'hf7) $display("FAIL: addr=28, expected=0xf7, got=%h", vlc_code);
        
        addr = 6'd29; #10;
        if (vlc_code !== 8'he6) $display("FAIL: addr=29, expected=0xe6, got=%h", vlc_code);
        
        addr = 6'd30; #10;
        if (vlc_code !== 8'hd6) $display("FAIL: addr=30, expected=0xd6, got=%h", vlc_code);
        
        addr = 6'd31; #10;
        if (vlc_code !== 8'hd4) $display("FAIL: addr=31, expected=0xd4, got=%h", vlc_code);
        
        addr = 6'd32; #10;
        if (vlc_code !== 8'hb7) $display("FAIL: addr=32, expected=0xb7, got=%h", vlc_code);
        
        addr = 6'd33; #10;
        if (vlc_code !== 8'he7) $display("FAIL: addr=33, expected=0xe7, got=%h", vlc_code);
        
        addr = 6'd34; #10;
        if (vlc_code !== 8'ha6) $display("FAIL: addr=34, expected=0xa6, got=%h", vlc_code);
        
        addr = 6'd35; #10;
        if (vlc_code !== 8'hc5) $display("FAIL: addr=35, expected=0xc5, got=%h", vlc_code);
        
        addr = 6'd36; #10;
        if (vlc_code !== 8'hf8) $display("FAIL: addr=36, expected=0xf8, got=%h", vlc_code);
        
        addr = 6'd37; #10;
        if (vlc_code !== 8'ha7) $display("FAIL: addr=37, expected=0xa7, got=%h", vlc_code);
        
        addr = 6'd38; #10;
        if (vlc_code !== 8'hd7) $display("FAIL: addr=38, expected=0xd7, got=%h", vlc_code);
        
        addr = 6'd39; #10;
        if (vlc_code !== 8'hc6) $display("FAIL: addr=39, expected=0xc6, got=%h", vlc_code);
        
        addr = 6'd40; #10;
        if (vlc_code !== 8'hb8) $display("FAIL: addr=40, expected=0xb8, got=%h", vlc_code);
        
        addr = 6'd41; #10;
        if (vlc_code !== 8'he8) $display("FAIL: addr=41, expected=0xe8, got=%h", vlc_code);
        
        addr = 6'd42; #10;
        if (vlc_code !== 8'h97) $display("FAIL: addr=42, expected=0x97, got=%h", vlc_code);
        
        addr = 6'd43; #10;
        if (vlc_code !== 8'hc7) $display("FAIL: addr=43, expected=0xc7, got=%h", vlc_code);
        
        addr = 6'd44; #10;
        if (vlc_code !== 8'h88) $display("FAIL: addr=44, expected=0x88, got=%h", vlc_code);
        
        addr = 6'd45; #10;
        if (vlc_code !== 8'ha8) $display("FAIL: addr=45, expected=0xa8, got=%h", vlc_code);
        
        addr = 6'd46; #10;
        if (vlc_code !== 8'hd8) $display("FAIL: addr=46, expected=0xd8, got=%h", vlc_code);
        
        addr = 6'd47; #10;
        if (vlc_code !== 8'h87) $display("FAIL: addr=47, expected=0x87, got=%h", vlc_code);
        
        addr = 6'd48; #10;
        if (vlc_code !== 8'hd9) $display("FAIL: addr=48, expected=0xd9, got=%h", vlc_code);
        
        addr = 6'd49; #10;
        if (vlc_code !== 8'h78) $display("FAIL: addr=49, expected=0x78, got=%h", vlc_code);
        
        addr = 6'd50; #10;
        if (vlc_code !== 8'h98) $display("FAIL: addr=50, expected=0x98, got=%h", vlc_code);
        
        addr = 6'd51; #10;
        if (vlc_code !== 8'hc8) $display("FAIL: addr=51, expected=0xc8, got=%h", vlc_code);
        
        addr = 6'd52; #10;
        if (vlc_code !== 8'h99) $display("FAIL: addr=52, expected=0x99, got=%h", vlc_code);
        
        addr = 6'd53; #10;
        if (vlc_code !== 8'hc9) $display("FAIL: addr=53, expected=0xc9, got=%h", vlc_code);
        
        addr = 6'd54; #10;
        if (vlc_code !== 8'hb9) $display("FAIL: addr=54, expected=0xb9, got=%h", vlc_code);
        
        addr = 6'd55; #10;
        if (vlc_code !== 8'ha9) $display("FAIL: addr=55, expected=0xa9, got=%h", vlc_code);
        
        addr = 6'd56; #10;
        if (vlc_code !== 8'h59) $display("FAIL: addr=56, expected=0x59, got=%h", vlc_code);
        
        addr = 6'd57; #10;
        if (vlc_code !== 8'h89) $display("FAIL: addr=57, expected=0x89, got=%h", vlc_code);
        
        addr = 6'd58; #10;
        if (vlc_code !== 8'h79) $display("FAIL: addr=58, expected=0x79, got=%h", vlc_code);
        
        addr = 6'd59; #10;
        if (vlc_code !== 8'h69) $display("FAIL: addr=59, expected=0x69, got=%h", vlc_code);
        
        addr = 6'd60; #10;
        if (vlc_code !== 8'h19) $display("FAIL: addr=60, expected=0x19, got=%h", vlc_code);
        
        addr = 6'd61; #10;
        if (vlc_code !== 8'h49) $display("FAIL: addr=61, expected=0x49, got=%h", vlc_code);
        
        addr = 6'd62; #10;
        if (vlc_code !== 8'h39) $display("FAIL: addr=62, expected=0x39, got=%h", vlc_code);
        
        addr = 6'd63; #10;
        if (vlc_code !== 8'h29) $display("FAIL: addr=63, expected=0x29, got=%h", vlc_code);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule