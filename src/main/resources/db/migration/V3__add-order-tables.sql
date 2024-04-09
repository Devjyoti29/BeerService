IF OBJECT_ID('dbo.beer_order_line', 'U') IS NOT NULL
    DROP TABLE dbo.beer_order_line;
GO
IF OBJECT_ID('dbo.beer_order', 'U') IS NOT NULL
    DROP TABLE dbo.beer_order;
GO


CREATE TABLE [beer_order]
(
    [id]                 varchar(36) NOT NULL,
    [created_date]       datetime  DEFAULT NULL,
    [customer_ref]       varchar(255) DEFAULT NULL,
    [last_modified_date] datetime  DEFAULT NULL,
    [version]            bigint       DEFAULT NULL,
    [customer_id]        varchar(36)  DEFAULT NULL,
    PRIMARY KEY ([id]),
    CONSTRAINT FK_beer_order_customer_id FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
);

CREATE TABLE [beer_order_line]
(
    [id]                 varchar(36) NOT NULL,
    [beer_id]            varchar(36) DEFAULT NULL,
    [created_date]       datetime DEFAULT NULL,
    [last_modified_date] datetime DEFAULT NULL,
    [order_quantity]     int         DEFAULT NULL,
    [quantity_allocated] int         DEFAULT NULL,
    [version]            bigint      DEFAULT NULL,
    [beer_order_id]      varchar(36) DEFAULT NULL,
    PRIMARY KEY ([id]),
    CONSTRAINT FK_beer_order_line_beer_order_id FOREIGN KEY ([beer_order_id]) REFERENCES [beer_order] ([id]),
    CONSTRAINT FK_beer_order_line_beer_id FOREIGN KEY ([beer_id]) REFERENCES [beer] ([id])
);
