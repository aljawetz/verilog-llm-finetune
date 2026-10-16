`timescale 1ns/1ps

module tb_Code_Converter;

    reg [3:0] code_in;
    reg [1:0] select;
    wire [3:0] code_out;

    // Instantiate the Code_Converter module
    Code_Converter uut (
        .code_in(code_in),
        .select(select),
        .code_out(code_out)
    );

    initial begin
        // Test Binary to Gray conversion
        select = 2'b00;

        // Test all binary inputs
        code_in = 4'b0000; #10; if (code_out !== 4'b0000) $display("FAIL: Binary to Gray conversion failed for 0000");
        code_in = 4'b0001; #10; if (code_out !== 4'b0001) $display("FAIL: Binary to Gray conversion failed for 0001");
        code_in = 4'b0010; #10; if (code_out !== 4'b0011) $display("FAIL: Binary to Gray conversion failed for 0010");
        code_in = 4'b0011; #10; if (code_out !== 4'b0010) $display("FAIL: Binary to Gray conversion failed for 0011");
        code_in = 4'b0100; #10; if (code_out !== 4'b0110) $display("FAIL: Binary to Gray conversion failed for 0100");
        code_in = 4'b0101; #10; if (code_out !== 4'b0111) $display("FAIL: Binary to Gray conversion failed for 0101");
        code_in = 4'b0110; #10; if (code_out !== 4'b0101) $display("FAIL: Binary to Gray conversion failed for 0110");
        code_in = 4'b0111; #10; if (code_out !== 4'b0100) $display("FAIL: Binary to Gray conversion failed for 0111");
        code_in = 4'b1000; #10; if (code_out !== 4'b1100) $display("FAIL: Binary to Gray conversion failed for 1000");
        code_in = 4'b1001; #10; if (code_out !== 4'b1101) $display("FAIL: Binary to Gray conversion failed for 1001");
        code_in = 4'b1010; #10; if (code_out !== 4'bxxxx) $display("FAIL: Binary to Gray conversion failed for 1010");

        // Test BCD to Excess-3 conversion
        select = 2'b01;

        // Test valid BCD inputs
        code_in = 4'b0000; #10; if (code_out !== 4'b0011) $display("FAIL: BCD to Excess-3 conversion failed for 0000");
        code_in = 4'b0001; #10; if (code_out !== 4'b0100) $display("FAIL: BCD to Excess-3 conversion failed for 0001");
        code_in = 4'b0010; #10; if (code_out !== 4'b0101) $display("FAIL: BCD to Excess-3 conversion failed for 0010");
        code_in = 4'b0011; #10; if (code_out !== 4'b0110) $display("FAIL: BCD to Excess-3 conversion failed for 0011");
        code_in = 4'b0100; #10; if (code_out !== 4'b0111) $display("FAIL: BCD to Excess-3 conversion failed for 0100");
        code_in = 4'b0101; #10; if (code_out !== 4'b1000) $display("FAIL: BCD to Excess-3 conversion failed for 0101");
        code_in = 4'b0110; #10; if (code_out !== 4'b1001) $display("FAIL: BCD to Excess-3 conversion failed for 0110");
        code_in = 4'b0111; #10; if (code_out !== 4'b1010) $display("FAIL: BCD to Excess-3 conversion failed for 0111");
        code_in = 4'b1000; #10; if (code_out !== 4'b1011) $display("FAIL: BCD to Excess-3 conversion failed for 1000");
        code_in = 4'b1001; #10; if (code_out !== 4'b1100) $display("FAIL: BCD to Excess-3 conversion failed for 1001");
        code_in = 4'b1010; #10; if (code_out !== 4'bxxxx) $display("FAIL: BCD to Excess-3 conversion failed for 1010");

        // Test Gray to Binary conversion
        select = 2'b10;

        // Test valid Gray inputs
        code_in = 4'b0000; #10; if (code_out !== 4'b0000) $display("FAIL: Gray to Binary conversion failed for 0000");
        code_in = 4'b0001; #10; if (code_out !== 4'b0001) $display("FAIL: Gray to Binary conversion failed for 0001");
        code_in = 4'b0011; #10; if (code_out !== 4'b0010) $display("FAIL: Gray to Binary conversion failed for 0011");
        code_in = 4'b0010; #10; if (code_out !== 4'b0011) $display("FAIL: Gray to Binary conversion failed for 0010");
        code_in = 4'b0110; #10; if (code_out !== 4'b0100) $display("FAIL: Gray to Binary conversion failed for 0110");
        code_in = 4'b0111; #10; if (code_out !== 4'b0101) $display("FAIL: Gray to Binary conversion failed for 0111");
        code_in = 4'b0101; #10; if (code_out !== 4'b0110) $display("FAIL: Gray to Binary conversion failed for 0101");
        code_in = 4'b0100; #10; if (code_out !== 4'b0111) $display("FAIL: Gray to Binary conversion failed for 0100");
        code_in = 4'b1100; #10; if (code_out !== 4'b1000) $display("FAIL: Gray to Binary conversion failed for 1100");
        code_in = 4'b1101; #10; if (code_out !== 4'b1001) $display("FAIL: Gray to Binary conversion failed for 1101");

        // Test Excess-3 to BCD conversion
        select = 2'b11;

        // Test valid Excess-3 inputs
        code_in = 4'b0011; #10; if (code_out !== 4'b0000) $display("FAIL: Excess-3 to BCD conversion failed for 0011");
        code_in = 4'b0100; #10; if (code_out !== 4'b0001) $display("FAIL: Excess-3 to BCD conversion failed for 0100");
        code_in = 4'b0101; #10; if (code_out !== 4'b0010) $display("FAIL: Excess-3 to BCD conversion failed for 0101");
        code_in = 4'b0110; #10; if (code_out !== 4'b0011) $display("FAIL: Excess-3 to BCD conversion failed for 0110");
        code_in = 4'b0111; #10; if (code_out !== 4'b0100) $display("FAIL: Excess-3 to BCD conversion failed for 0111");
        code_in = 4'b1000; #10; if (code_out !== 4'b0101) $display("FAIL: Excess-3 to BCD conversion failed for 1000");
        code_in = 4'b1001; #10; if (code_out !== 4'b0110) $display("FAIL: Excess-3 to BCD conversion failed for 1001");
        code_in = 4'b1010; #10; if (code_out !== 4'bxxxx) $display("FAIL: Excess-3 to BCD conversion failed for 1010");
        code_in = 4'b1100; #10; if (code_out !== 4'bxxxx) $display("FAIL: Excess-3 to BCD conversion failed for 1100");
        code_in = 4'b1101; #10; if (code_out !== 4'bxxxx) $display("FAIL: Excess-3 to BCD conversion failed for 1101");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule