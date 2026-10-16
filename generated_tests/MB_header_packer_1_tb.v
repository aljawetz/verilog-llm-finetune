`timescale 1ns/1ps

module tb_MB_header_packer;

    reg [8:0] codebit0;
    reg [4:0] codelength0;
    reg valid;
    reg mvd_valid;
    wire [16:0] CodeOut;
    wire [4:0] CodeLength;

    // Instantiate the module under test (uut)
    MB_header_packer uut (
        .codebit0(codebit0),
        .codelength0(codelength0),
        .CodeOut(CodeOut),
        .CodeLength(CodeLength),
        .valid(valid),
        .mvd_valid(mvd_valid)
    );

    initial begin
        // Test case 1: Valid inputs with codelength0 = 1
        codebit0 = 9'b000000000; codelength0 = 5'd1; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b10000000000000000 || CodeLength !== 5'd1) 
            $display("FAIL: Test case 1 failed");

        // Test case 2: Valid inputs with codelength0 = 2
        codebit0 = 9'b000000011; codelength0 = 5'd2; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b00000000000000011 || CodeLength !== 5'd2) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Valid inputs with codelength0 = 3
        codebit0 = 9'b000000011; codelength0 = 5'd3; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b00000000000000110 || CodeLength !== 5'd3) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: Valid inputs with codelength0 = 4
        codebit0 = 9'b00001111; codelength0 = 5'd4; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b0000000000001111 || CodeLength !== 5'd4) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Valid inputs with codelength0 = 5
        codebit0 = 9'b00000111; codelength0 = 5'd5; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b00000000000001110 || CodeLength !== 5'd5) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: Valid inputs with codelength0 = 6
        codebit0 = 9'b111111111; codelength0 = 5'd6; valid = 1; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b00000011111111111 || CodeLength !== 5'd6) 
            $display("FAIL: Test case 6 failed");

        // Test case 7: Invalid inputs (valid = 0)
        codebit0 = 9'b000000011; codelength0 = 5'd4; valid = 0; mvd_valid = 1;
        #10;
        if (CodeOut !== 17'b00000000000000000 || CodeLength !== 5'd0) 
            $display("FAIL: Test case 7 failed");

        // Test case 8: Invalid inputs (mvd_valid = 0)
        codebit0 = 9'b000000011; codelength0 = 5'd4; valid = 1; mvd_valid = 0;
        #10;
        if (CodeOut !== 17'b00000000000000000 || CodeLength !== 5'd0) 
            $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule