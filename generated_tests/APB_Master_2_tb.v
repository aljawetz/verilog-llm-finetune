`timescale 1ns/1ps

module tb_APB_Master;
    reg PCLK;
    reg PRESETn;
    reg PSEL;
    reg PENABLE;
    reg PWRITE;
    reg [7:0] PADDR;
    reg [7:0] PWDATA;
    wire [7:0] PRDATA;
    wire PREADY;

    // Instantiate the module under test (uut)
    APB_Master uut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY)
    );

    // Clock generation
    initial begin
        PCLK = 0;
        forever #5 PCLK = ~PCLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        PRESETn = 0;
        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 8'b0;
        PWDATA = 8'b0;

        // Apply reset
        #10;
        PRESETn = 1;

        // Test writing to register 0
        PSEL = 1;
        PADDR = 8'd0;
        PWDATA = 8'hAA; // Data to write
        PWRITE = 1;
        #10; // Wait for one clock cycle
        PENABLE = 1; // Enable the transaction
        #10; // Wait for one clock cycle
        PENABLE = 0; // Disable the transaction
        PSEL = 0; // Deselect

        // Check if data was written correctly
        if (uut.registers[0] !== 8'hAA) begin
            $display("FAIL: Register 0 did not store the correct value.");
            $finish;
        end

        // Test reading from register 0
        PSEL = 1;
        PADDR = 8'd0;
        PWRITE = 0; // Read operation
        #10; // Wait for one clock cycle
        PENABLE = 1; // Enable the transaction
        #10; // Wait for one clock cycle
        PENABLE = 0; // Disable the transaction
        PSEL = 0; // Deselect

        // Check if read data is correct
        if (PRDATA !== 8'hAA) begin
            $display("FAIL: Read from Register 0 did not return the correct value.");
            $finish;
        end

        // Test writing to register 1
        PSEL = 1;
        PADDR = 8'd1;
        PWDATA = 8'h55; // Data to write
        PWRITE = 1;
        #10; // Wait for one clock cycle
        PENABLE = 1; // Enable the transaction
        #10; // Wait for one clock cycle
        PENABLE = 0; // Disable the transaction
        PSEL = 0; // Deselect

        // Check if data was written correctly
        if (uut.registers[1] !== 8'h55) begin
            $display("FAIL: Register 1 did not store the correct value.");
            $finish;
        end

        // Test reading from register 1
        PSEL = 1;
        PADDR = 8'd1;
        PWRITE = 0; // Read operation
        #10; // Wait for one clock cycle
        PENABLE = 1; // Enable the transaction
        #10; // Wait for one clock cycle
        PENABLE = 0; // Disable the transaction
        PSEL = 0; // Deselect

        // Check if read data is correct
        if (PRDATA !== 8'h55) begin
            $display("FAIL: Read from Register 1 did not return the correct value.");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule