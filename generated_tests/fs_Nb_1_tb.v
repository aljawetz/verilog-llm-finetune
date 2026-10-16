`timescale 1ns/1ps

module tb_fs_Nb;

    reg BORROW_IN;
    reg [3:0] IN0;
    reg [3:0] IN1;
    wire [3:0] SUB;
    wire BORROW_OUT;

    // Instantiate the module under test
    fs_Nb uut (
        .BORROW_IN(BORROW_IN),
        .IN0(IN0),
        .IN1(IN1),
        .SUB(SUB),
        .BORROW_OUT(BORROW_OUT)
    );

    initial begin
        // Test case 1: 5 - 3 with no borrow in
        BORROW_IN = 0; IN0 = 4'b0101; IN1 = 4'b0011; #10;
        if (SUB !== 4'b0010 || BORROW_OUT !== 0) $display("FAIL: Test case 1 failed");
        
        // Test case 2: 2 - 3 with no borrow in
        BORROW_IN = 0; IN0 = 4'b0010; IN1 = 4'b0011; #10;
        if (SUB !== 4'b1111 || BORROW_OUT !== 1) $display("FAIL: Test case 2 failed");
        
        // Test case 3: 7 - 5 with no borrow in
        BORROW_IN = 0; IN0 = 4'b0111; IN1 = 4'b0101; #10;
        if (SUB !== 4'b0010 || BORROW_OUT !== 0) $display("FAIL: Test case 3 failed");
        
        // Test case 4: 0 - 1 with no borrow in
        BORROW_IN = 0; IN0 = 4'b0000; IN1 = 4'b0001; #10;
        if (SUB !== 4'b1111 || BORROW_OUT !== 1) $display("FAIL: Test case 4 failed");
        
        // Test case 5: 4 - 2 with borrow in
        BORROW_IN = 1; IN0 = 4'b0100; IN1 = 4'b0010; #10;
        if (SUB !== 4'b0001 || BORROW_OUT !== 0) $display("FAIL: Test case 5 failed");
        
        // Test case 6: 3 - 4 with borrow in
        BORROW_IN = 1; IN0 = 4'b0011; IN1 = 4'b0100; #10;
        if (SUB !== 4'b1110 || BORROW_OUT !== 1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule