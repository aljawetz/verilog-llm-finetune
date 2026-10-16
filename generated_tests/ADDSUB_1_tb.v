`timescale 1ns/1ps

module tb_ADDSUB;

    // Inputs
    reg [7:0] ADDSUB_in1;
    reg [7:0] ADDSUB_in2;
    reg su;

    // Outputs
    wire [7:0] ADDSUB_out;

    // Instantiate the Unit Under Test (UUT)
    ADDSUB uut (
        .ADDSUB_out(ADDSUB_out),
        .ADDSUB_in1(ADDSUB_in1),
        .ADDSUB_in2(ADDSUB_in2),
        .su(su)
    );

    initial begin
        // Test case 1: Addition
        ADDSUB_in1 = 8'h1A; // 26
        ADDSUB_in2 = 8'h05; // 5
        su = 0; // Addition
        #10;
        if (ADDSUB_out !== 8'h1F) $display("FAIL: Test case 1 failed, expected 0x1F, got %h", ADDSUB_out);

        // Test case 2: Subtraction
        ADDSUB_in1 = 8'h1A; // 26
        ADDSUB_in2 = 8'h05; // 5
        su = 1; // Subtraction
        #10;
        if (ADDSUB_out !== 8'h15) $display("FAIL: Test case 2 failed, expected 0x15, got %h", ADDSUB_out);

        // Test case 3: Addition with carry
        ADDSUB_in1 = 8'hFF; // 255
        ADDSUB_in2 = 8'h01; // 1
        su = 0; // Addition
        #10;
        if (ADDSUB_out !== 8'h00) $display("FAIL: Test case 3 failed, expected 0x00, got %h", ADDSUB_out);

        // Test case 4: Subtraction resulting in negative
        ADDSUB_in1 = 8'h05; // 5
        ADDSUB_in2 = 8'h1A; // 26
        su = 1; // Subtraction
        #10;
        if (ADDSUB_out !== 8'hEB) $display("FAIL: Test case 4 failed, expected 0xEB, got %h", ADDSUB_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule