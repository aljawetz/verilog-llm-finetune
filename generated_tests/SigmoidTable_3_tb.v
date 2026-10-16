`timescale 1ns/1ps

module tb_SigmoidTable;

    reg [15:0] x;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    SigmoidTable uut (
        .x(x),
        .y(y)
    );

    initial begin
        // Test cases
        // Test saturated values
        x = 16'h0000; #10; // Expect y = 8'h10
        if (y !== 8'h10) $display("FAIL: Expected y = 8'h10 for x = 16'h0000, got y = %h", y);

        x = 16'h0001; #10; // Expect y = 8'h10
        if (y !== 8'h10) $display("FAIL: Expected y = 8'h10 for x = 16'h0001, got y = %h", y);

        x = 16'h007F; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h007F, got y = %h", y);

        x = 16'h0080; #10; // Expect y = 8'h00
        if (y !== 8'h00) $display("FAIL: Expected y = 8'h00 for x = 16'h0080, got y = %h", y);

        x = 16'hFFFF; #10; // Expect y = 8'h20
        if (y !== 8'h20) $display("FAIL: Expected y = 8'h20 for x = 16'hFFFF, got y = %h", y);

        // Test non-saturated negative values
        x = 16'hFF80; #10; // Expect y = 8'h00
        if (y !== 8'h00) $display("FAIL: Expected y = 8'h00 for x = 16'hFF80, got y = %h", y);

        // Test non-saturated positive values
        x = 16'h007F; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h007F, got y = %h", y);

        // Test edge cases
        x = 16'h0100; #10; // Expect y = 8'h20
        if (y !== 8'h20) $display("FAIL: Expected y = 8'h20 for x = 16'h0100, got y = %h", y);

        x = 16'hFF00; #10; // Expect y = 8'h00
        if (y !== 8'h00) $display("FAIL: Expected y = 8'h00 for x = 16'hFF00, got y = %h", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule