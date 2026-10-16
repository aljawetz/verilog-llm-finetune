`timescale 1ns/1ps

module tb_MUX1;

    reg [7:0] In1;
    reg [7:0] In2;
    reg Sel;
    wire [7:0] Out;

    // Instantiate the MUX1 module
    MUX1 uut (
        .In1(In1),
        .In2(In2),
        .Sel(Sel),
        .Out(Out)
    );

    initial begin
        // Test case 1: Sel = 1, expect Out = In1
        In1 = 8'b10101010; 
        In2 = 8'b01010101; 
        Sel = 1'b1; 
        #10;
        if (Out !== In1) begin
            $display("FAIL: Test case 1 failed, expected Out = %b, got Out = %b", In1, Out);
            $finish;
        end

        // Test case 2: Sel = 0, expect Out = In2
        In1 = 8'b10101010; 
        In2 = 8'b01010101; 
        Sel = 1'b0; 
        #10;
        if (Out !== In2) begin
            $display("FAIL: Test case 2 failed, expected Out = %b, got Out = %b", In2, Out);
            $finish;
        end

        // Test case 3: Change inputs and test again
        In1 = 8'b11110000; 
        In2 = 8'b00001111; 
        Sel = 1'b1; 
        #10;
        if (Out !== In1) begin
            $display("FAIL: Test case 3 failed, expected Out = %b, got Out = %b", In1, Out);
            $finish;
        end

        // Test case 4: Change inputs and test again
        In1 = 8'b11110000; 
        In2 = 8'b00001111; 
        Sel = 1'b0; 
        #10;
        if (Out !== In2) begin
            $display("FAIL: Test case 4 failed, expected Out = %b, got Out = %b", In2, Out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule