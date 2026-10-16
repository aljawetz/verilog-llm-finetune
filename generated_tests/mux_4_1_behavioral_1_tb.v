`timescale 1ns/1ps

module tb_mux_4_1_behavioral;

    reg [3:0] i;
    reg [1:0] sel;
    wire y;

    // Instantiate the module under test (uut)
    mux_4_1_behavioral uut (
        .i(i),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        i = 4'b1010; // i = 10
        sel = 2'b00; // Select i[0]
        #10;
        if (y !== i[0]) $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i[0], y);

        // Test case 2: Select input 1
        sel = 2'b01; // Select i[1]
        #10;
        if (y !== i[1]) $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i[1], y);

        // Test case 3: Select input 2
        sel = 2'b10; // Select i[2]
        #10;
        if (y !== i[2]) $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i[2], y);

        // Test case 4: Select input 3
        sel = 2'b11; // Select i[3]
        #10;
        if (y !== i[3]) $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i[3], y);

        // Test case 5: Check default case
        sel = 2'bxx; // Invalid selection
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);

        $display("PASS");
        $finish;
    end

endmodule