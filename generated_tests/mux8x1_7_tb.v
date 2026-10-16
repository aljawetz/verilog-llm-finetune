`timescale 1ns/1ps

module tb_mux8x1;

    reg [7:0] datain;
    reg [2:0] s;
    wire dataout;

    // Instantiate the module under test (uut)
    mux8x1 uut (
        .datain(datain),
        .s(s),
        .dataout(dataout)
    );

    initial begin
        // Test sequence
        // Test case 1: Select first input
        datain = 8'b10101010; // datain = 0b10101010
        s = 3'd0; #10;
        if (dataout !== datain[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", datain[0], dataout);
            $finish;
        end

        // Test case 2: Select second input
        s = 3'd1; #10;
        if (dataout !== datain[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", datain[1], dataout);
            $finish;
        end

        // Test case 3: Select third input
        s = 3'd2; #10;
        if (dataout !== datain[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", datain[2], dataout);
            $finish;
        end

        // Test case 4: Select fourth input
        s = 3'd3; #10;
        if (dataout !== datain[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", datain[3], dataout);
            $finish;
        end

        // Test case 5: Select fifth input
        s = 3'd4; #10;
        if (dataout !== datain[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", datain[4], dataout);
            $finish;
        end

        // Test case 6: Select sixth input
        s = 3'd5; #10;
        if (dataout !== datain[5]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", datain[5], dataout);
            $finish;
        end

        // Test case 7: Select seventh input
        s = 3'd6; #10;
        if (dataout !== datain[6]) begin
            $display("FAIL: Test case 7 failed, expected %b, got %b", datain[6], dataout);
            $finish;
        end

        // Test case 8: Select eighth input
        s = 3'd7; #10;
        if (dataout !== datain[7]) begin
            $display("FAIL: Test case 8 failed, expected %b, got %b", datain[7], dataout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule