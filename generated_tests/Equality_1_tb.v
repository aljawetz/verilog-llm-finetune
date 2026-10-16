`timescale 1ns/1ps

module tb_Equality;

    reg [2:0] A;
    reg [2:0] B;
    wire Y1;
    wire Y2;
    wire [2:0] Y3;

    // Instantiate the module under test (uut)
    Equality uut (
        .A(A),
        .B(B),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        // Test case 1: A = 3'b000, B = 3'b000 (Equal)
        A = 3'b000; B = 3'b000;
        #10;
        if (Y1 !== 1'b1 || Y2 !== 1'b0 || Y3 !== 3'b000) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 3'b001, B = 3'b001 (Equal)
        A = 3'b001; B = 3'b001;
        #10;
        if (Y1 !== 1'b1 || Y2 !== 1'b0 || Y3 !== 3'b001) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: A = 3'b010, B = 3'b011 (Not Equal)
        A = 3'b010; B = 3'b011;
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b1 || Y3 !== 3'b011) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: A = 3'b111, B = 3'b111 (Equal)
        A = 3'b111; B = 3'b111;
        #10;
        if (Y1 !== 1'b1 || Y2 !== 1'b0 || Y3 !== 3'b111) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: A = 3'b101, B = 3'b100 (Not Equal)
        A = 3'b101; B = 3'b100;
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b1 || Y3 !== 3'b100) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule